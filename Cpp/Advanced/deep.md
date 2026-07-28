# Deep Dive into Modern C

## C11

(ISO/IEC 9899:2011) — the last major overhaul before C23

`_Generic` selections let you do compile-time type dispatch — the closest C gets to function overloading

```c
#define print_val(x) _Generic((x),    \
    int:     print_int,                \
    double:  print_double,             \
    char*:   print_str                 \
)(x)
```

`_Static_assert` catches errors at compile time instead of runtime

```c
_Static_assert(sizeof(int) == 4, "This code requires 32-bit ints");
```

`_Alignas` and `_Alignof` give you control over memory alignment, which matters for SIMD, cache performance, and hardware registers

```c
_Alignas(16) int x;                     // force x to be aligned on a 16-byte boundary
size_t a = _Alignof(struct my_struct);  // query alignment requirement
printf("Alignment of x: %zu\n", _Alignof(x));
```

Atomics (`<stdatomic.h>`) provide lock-free concurrent data access:

```c
#include <stdatomic.h>
atomic_int counter = 0;
atomic_fetch_add(&counter, 1);  // thread-safe increment
```

Threads (`<threads.h>`) standardized threading in C for the first time. Before C11, you had to use platform-specific APIs (pthreads on Unix, Win32 threads on Windows). C11 gives you `thrd_create`, `mtx_lock`, `cnd_wait`, etc. In practice, most codebases still use pthreads directly because `<threads.h>` adoption was slow, but knowing the standard API matters.

`_Noreturn` tells the compiler a function never returns (like exit() or abort()), enabling better optimization and warnings.

## C17

C17 introduced no new language features. It was purely a defect-fix release that clarified ambiguities in C11's wording and resolved defect reports. The value of `__STDC_VERSION__` changed to `201710L`.

You should compile with -std=c17 as your baseline today — it's the "stable C11" that fixed the rough edges.

## Pointer Arithmetic

```c
int arr[5]; // arr is an array of 5 ints (20 bytes)
int *p = arr; // arr decays to &arr[0] — a pointer to the first element
sizeof(arr) // 20 (full array size: 5 × 4 bytes)
sizeof(p) // 8 (just a pointer, always 8 bytes on 64-bit)
func(arr); // arr decays to int* when passed to a function
&arr // type is int(*)[5] — pointer to the whole array, NOT int*
```

Pointer subtraction gives you the number of elements between two pointers, not the number of bytes:

```c
int *start = &arr[0];
int *end = &arr[4];
ptrdiff_t dist = end - start;  // 4, not 16
```

The result type is `ptrdiff_t` (a signed integer type from `<stddef.h>`).

```c
int arr[5];
int *p = arr;

// Legal operations
p + 3           // pointer + integer
p - 2           // pointer - integer
p++; p--;       // increment/decrement
p2 - p1         // pointer - pointer (same array)
p1 < p2         // comparison (same array)
p1 == p2        // equality

// Illegal / undefined behavior
p1 + p2         // pointer + pointer — meaningless
p * 2           // pointer × integer — meaningless
p + 6           // past one-past-the-end — UB to dereference
```

## Array decay

"Decay" is the implicit conversion of an array name into a pointer to its first element. It happens automatically in almost every context:

```c
int arr[5] = {10, 20, 30, 40, 50};

int *p = arr;          // arr decays to &arr[0]
printf("%d", *arr);    // arr decays, then is dereferenced
some_func(arr);        // arr decays when passed to a function
```

**The `&arr` vs `arr` distinction:**

```c
int arr[5];

int *p1 = arr;        // p1 is int*, points to first element
int (*p2)[5] = &arr;  // p2 is int(*)[5], points to the whole array

// Same address, different types, different arithmetic:
p1 + 1    // advances by sizeof(int) = 4 bytes
p2 + 1    // advances by sizeof(int[5]) = 20 bytes!
```

> ***Think of it this way:*** *an array is a contiguous block of memory with a compile-time-known size. A pointer is just an address with a type. Decay is the moment C forgets the size and gives you only the address. Every time you pass an array across a function boundary, through a pointer assignment, or into an expression, the compiler strips the size information away. Your job as a C programmer is to carry that size alongside the pointer everywhere it goes — which is exactly why you see* `(int *arr, size_t len)` *pairs throughout every well-written C codebase.*
