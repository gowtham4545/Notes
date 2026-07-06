# GDB

*The GNU Debugger (GDB) is a popular, free, and open-source debugger for C and C++ programs, which is
widely used in Unix-like systems. It allows developers to run, stop, and modify the execution of
programs, monitor and modify the values of variables, and call functions independently of the program's
normal behavior. GDB offers extensive facilities for tracing and altering the execution of computer
programs, making it a powerful tool for debugging and issue resolution*

<pre>
$gdb
GNU gdb (GDB) 7.6.1
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "mingw32".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb)
</pre>

## Basic

### Steps

#### 1. Create C program / programs

#### 2. Compile the C program with debugging information

   Compile the C program with the -g flag to include debugging information in the executable file. This flag tells the compiler to add references to the source code in the executable, which allows GDB to map instructions in the compiled binary executable to their corresponding line, variable, or function in the source code.

   ```bash
   gcc -g -o hello hello.c
   ```

#### 3. Start GDB

   ```gdb
   gdb hello
   ```

##### Run the program

   run the core

   ```gdb
   (gdb) run
   ```

##### Set a breakpoint

   Set a breakpoint at the line where you want to pause the program execution.

   ```gdb
   (gdb) break main
   ```

##### Inspect the program state

   Once the program execution is paused at the breakpoint, you can inspect the program state.

   ```gdb
   (gdb) print var
   ```

##### Continue the execution

   ```gdb
   (gdb) continue
   ```

##### Backtrace

   It backtracks the execution flow in the stack

   ```gdb
   (gdb) bt
   ```

##### Show frame

   Shows the value in the frame(resistor).

   ```gdb
   (gdb) f 0 # reading the frame 0
   ```

#### 4. Exit

```gdb
(gdb) quit
```

## Other useful commands

`layout asm` - Displays the assembly code of the program.
`layout next` - Displays the next line of code to be executed.

----
`gcc -g -o hello hello.c` here `-g` flag adds debugging information to the executable file, which allows GDB to map instructions in the compiled binary executable to their corresponding line, variable, or function in the source code.

`gcc -O0 -g -o hello hello.c` here `-O0` flag disables optimization, which can make debugging easier by preserving the original structure of the code.

`gcc -o hello hello.c -s` here `-s` flag strips the debugging information from the executable file.

----

- Executes the next line of code in the current function, stepping over any function calls.

```gdb
(gdb) next 
```

- Executes the next line of assembly

```gdb
(gdb) nexti
```

`refresh` - Refreshes the display of the program state in GDB.

----

`x` - Examines the contents of memory at a specified address or variable.
`i` - Displays information about the program state, such as the current function, stack frames, and variables.
`x/i $pc` - Displays the assembly instruction at the current program counter (PC) address.

`info registers` - Displays the values of the CPU registers.

----

### Meaning of the commands

`mov    %edx,(%rax)` - This instruction moves the value in the EDX register into the memory location pointed to by the RAX register. Just like `*rax = edx` in C.

`callq  0x4004b0 <puts@plt>` - This instruction calls the function located at the address `0x4004b0`, which is the address of the `puts` function in the Procedure Linkage Table (PLT). The `@plt` suffix indicates that this is a call to a function that is dynamically linked at runtime.

For more reference visit the [manual](https://sourceware.org/gdb/current/onlinedocs/gdb.html/).
