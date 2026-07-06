# VPP Notes

Nodes, 3 types

- input nodes -> that takes packets as inputs and forward those packets to respective internal nodes
- internal nodes -> they do packet processing, dont take packet input
- process nodes -> They are kind of some housekeeping works, or a background activities (daemon).

**Plugin:**
plugins are the custom nodes, which can be added wherever we want in the node graph.

> **How VPP is efficient?**
> In scalar packet processing, each packet fetches instructions to instruction cache, at each node level. For example, if the path has 4 nodes in it, 3 packets fetches instructions 12 times. But in Vector packet processing, the instructions are stored in cache for next packets, so there is only 4 times instructions loaded.
> So more the number of similar packets, more efficient packet processing.

- 1 vector size is 256 packets.  // in the sense, 1 rx queue has the size of 256 packets.
- each core can process 1 vector.
- 1 thread = 1 core.
- each node has to find the metadata, process it/match it, and then forward it to next node.

## VPP low level architecture

### Algorithm

```algorithm
                      [dispatch fn()]
while packets in vector
    Get pointer to vector
    while 4 or more packets
        prefetch #3 and #4 packets
        process #1 & #2
        Assume next_node same as last packet
        update counters, advance buffers
        enqueue the packet to next_node
    while any packets
        <as above but single packet>
```

or a well defined algorithm is as follows:

```c
node_dispatch(vm, node, frame):
    from        = frame.vector_args        # input: array of buffer indices
    n_left_from = frame.n_vectors
    next_index  = node.cached_next_index   # speculated output node

    while n_left_from > 0:
        get_next_frame(next_index) -> to_next, n_left_to_next   # output slot

        # ---- dual loop: 2 at a time, needs >=4 in and >=2 out ----
        while n_left_from >= 4 and n_left_to_next >= 2:
            prefetch(buffers[2], buffers[3])         # header + data cachelines
            bi0, bi1        = from[0], from[1]
            to_next[0..1]   = bi0, bi1               # SPECULATE next_index
            from += 2;  to_next += 2
            n_left_from -= 2;  n_left_to_next -= 2

            process(b0, b1) -> next0, next1          # the real work
            update_counters(pkts, bytes, trace)
            validate_enqueue_x2(bi0, bi1, next0, next1)   # fix if next != next_index

        # ---- scalar loop: one packet at a time ----
        while n_left_from > 0 and n_left_to_next > 0:
            bi0        = from[0]
            to_next[0] = bi0                         # SPECULATE next_index
            from += 1;  to_next += 1
            n_left_from -= 1;  n_left_to_next -= 1

            process(b0) -> next0
            update_counters(...)
            validate_enqueue_x1(bi0, next0)

        put_next_frame(next_index, n_left_to_next)   # commit output frame

    return frame.n_vectors
```

***Note**: Here, 2 packets are processed in parallel, but if we have a powerful processor, we can process more packets in parallel.*

> *While writing code, the main concern should be optimizing the parser. This results lesser overhead for the core, and more packets can be processed in parallel. The parser should be optimized to reduce the number of instructions executed per packet.*

## VPP optimisation Techniques

1. Branch Prediction Hints:
   > This is like a hint to the compiler, that this branch is likely to be taken or not. This helps the compiler to optimize the code for better performance.
   > For example, suppose we have a `if-else` statement, and we know that the `if` condition is likely to be true most of the time. We can use the `likely()` macro to indicate this to the compiler, which can then optimize the code accordingly.
   - Use likely() and unlikely() macros to provide hints to the compiler about the expected outcome of conditional statements, improving branch prediction and reducing mispredictions.

    ```c
    // Define the macros using GCC/Clang built-ins
    #define likely(x)    __builtin_expect(!!(x), 1)
    #define unlikely(x)  __builtin_expect(!!(x), 0)

    void process_data(int status_code) {
        // Scenario: 99.9% of the time, the status is success (0)
        if (likely(status_code == 0)) {
            // FAST PATH: Placed sequentially in memory
            printf("Success: Processing data normally.\n");
        } else {
            // SLOW PATH: Moved away to the end of the function
            printf("Error: Handling rare exception %d.\n", status_code);
        }
    }
    ```

2. Prefetching:
   > Prefetching is a technique where we load data into the cache before it is actually needed, to reduce cache misses and improve performance. In VPP, we can prefetch packet headers and data before processing them, so that when we actually need to access them, they are already in the cache.
   - Use prefetching to load packet headers and data into the cache before processing, reducing cache misses and improving throughput.

3. Use of Vector instructions SSE/AVX:
   > Vector instructions allow us to process multiple data elements in a single instruction, which can significantly speed up packet processing. VPP can leverage SIMD (Single Instruction, Multiple Data) capabilities of modern CPUs to process multiple packets or multiple fields of a packet in parallel.
   - Utilize SIMD (Single Instruction, Multiple Data) capabilities of modern CPUs to process multiple packets or fields in parallel, enhancing throughput.

4. Speculations
   > Speculation is a technique where we make educated guesses about the outcome of certain operations, and proceed based on those guesses. In VPP, we can speculate on the next node to which a packet will be forwarded, and prepare the output frame accordingly. If our speculation is correct, we save time; if not, we correct it.

5. Dual Looping
   > Dual looping is a technique where we process two packets in parallel, instead of one at a time. This can be done by unrolling the loop and processing two packets in each iteration, which can improve performance by reducing loop overhead and increasing instruction-level parallelism.
