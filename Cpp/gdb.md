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

### Steps

#### 1. Create C program / programs
#### 2. Compile the C program with debugging information
   Compile the C program with the -g flag to include debugging information in the executable file. This flag tells the compiler to add references to the source code in the executable, which allows GDB to map instructions in the compiled binary executable to their corresponding line, variable, or function in the source code.
   
   ```bash
   gcc -g -o hello hello.c
   ```
#### 3. Start GDB
   ```
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
```
(gdb) quit
```

For more reference visit the [manual](https://sourceware.org/gdb/current/onlinedocs/gdb.html/).
   
   
   
   
   