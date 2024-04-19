# Cpp Concepts

#### Copy Constructors

```c++
#include<iostream>
using namespace std;

class Animal{
    Animal();   // Default constructor
    Animal(const Animal &a);    // Copy constructor
    Animal & operator = (const Animal & b); // copy operator
    ~Animal();  // destructor
}
```
<hr>

#### Explicit conversion

```cpp
int main(){
    int i='x'; //implicit conversion from char to asci int
    explicit int j='d'; // shows error, bcz declared as explicit variable and doesn't allow \
    implicit conversion
}
```

<hr>

#### Smart pointers

Smart Pointers are used to help ensure that programs are free of `memory and resource leaks` and are `exception-safe`.

View more about this [here](./smart_pointer.md)

<hr>

#### Lambda functions

<pre>
[ capture clause ] (parameters) -> return-type  
{   
   definition of method   
} 
</pre>



```cpp
int main(){
    int i=0;
    int x=[i](int &j=5) -> int {
        return j*i+5;
    }
}
```

<hr>

#### Constants

`const` and `constexpr` both are used for declaring constant variables. But `const` keyword is not completely pure constant.
```cpp
int getRandomNo()
{
  return rand() % 10;
}

int main()
{
    const int varB = getRandomNo();       // OK
    constexpr int varC = getRandomNo();   // not OK! compilation error

    return 0;
}
```
**Explanation**:
Value of varB would not anymore compile time. While statement with varC will throw compilation error. The reason is constexpr will always accept a strictly compile-time value.

<hr>

#### Conditional compilation

```cpp
'''statements'''
#if
#else
#ifdef
#ifndef
#elif
#endif
#if defined(MACRO)
#if !defined(MACRO)

'''Example'''

#pragma once    // For including files only once; but can be fooled by symbolic links.
#ifndef __PROGRAM    // For including files only once
#define __PROGRAM

#ifndef CONDITIONAL_H_
    #define CONDITIONAL_H_

    #ifdef _FOO
        #define _NUMBER 47
    #else
        #define _NUMBER 2
    #endif
#endif

#endif
```

<hr>

#### Format-Style `print()`

```cpp
#include<format>
using namespace std;

constexpr void print(const string_view str_fmt, auto&&... args){
    fputs(vformat(str_fmt, make_format_args(args...)).cstr(), stdout);
}

int main(){
    int i=5;
    print("The value is {}\n",i); // This works exactly like printf( format( "{}\n", i ));
}
```

Output:
```bash
The value is 5
```

<hr>

#### Concurrency

- **Sleeping**
    
    ```cpp
    // in windows
    #include<windows.h>
    int main(){
        sleep(5);
    }

    // in unix
    #include<thread>
    using std::this_thread::sleep_for;
    using std::this_thread::sleep_until;

    int main(){
        sleep_for(5s); // To wait for certain duration
        sleep_until(std::chrono::steady_clock::now()+2s); // To wait until certain point of time.
        return 0;
    }
    ```

- **Threading**
    
    ```cpp
    #include<thread>
    using thread;

    void thread_func(const int n){
        using millis=std::chrono::milliseconds;
        std::this_thread::sleep_for(millis(ms))
    }

    int main(){
        thread t1(thread_func,1);
        thread t2(thread_func,2);
        t1.detach(); // detach runs the thread asyncronously
        t2.detach();

        t1.join(); // join function waits for other threads to be executed before terminating...
        return 0;
    }
    ```

- **Chrono**
    
    ```cpp
    #include<chrono>
    using std::chrono;

    int main(){
        auto t=chrono::system_clock::now(); // gives the current time
        return 0;
    }
    ```
        
- **Mutex**
    
    ```cpp
    #include<mutex>

    std::mutex mut {};

    int main(){
        std::lock_guard<std::mutex> lock { mut }; // A lock that keeps hold of a global mutex object and coordinate threads.
        return 0;
    }
    ```
    
    other things to explore : [async](), [atomic variables](), [producer-consumer](), etc..

<hr>

#### Name Mangling

Since C++ supports function overloading, additional information has to be added to function names (called **Name mangling**) to avoid conflicts in binary code. 


```cpp
int f(void) { return 1; }
 
int f(int) { return 0; }
 
void g(void) { int i = f(), j = f(0); }
```

Some C++ compilers may mangle the above names to the following,  


```cpp
int __f_v(void) { return 1; }
 
int __f_i(int) { return 0; }
 
void __g_v(void) { int i = __f_v(), j = __f_i(0); }
```


<br>
<br>

##### **Handling C symbols when linking from C++**


<pre>
Note: C does not support function overloading, So, when we link a C code in C++, we have to make sure that name of a symbol is not changed.
</pre>

In C, names may not be mangled as it doesn’t support function overloading. So how to make sure that name of a symbol is not changed when we link a C code in C++.

```cpp
int printf(const char* format, ...);
 
int main()
{
    printf("Hello...");
    return 0;
}
```


<pre>
Compiler Error:

In function `main’:
f84cc4ebaf5b87bb8c6b97bc54245486.cpp:(.text+0xf): undefined reference to `printf(char const*, …)’
collect2: error: ld returned 1 exit status
</pre>

When some code is put in the extern “C” block, the C++ compiler ensures that the function names are un-mangled – that the compiler emits a binary file with their names unchanged, as a C compiler would do.

```cpp
extern "C" {
int printf(const char* format, ...);
}
 
int main()
{
    printf("Hello...");
    return 0;
}
```

Therefore, all C style header files (stdio.h, string.h, etc) have their declarations in the extern “C” block.


```cpp
#ifdef __cplusplus
extern "C" {
#endif
// Declarations of this file
#ifdef __cplusplus
}
#endif

```

#### [GDB Debugger](gdb.md)
The GNU Debugger (GDB) is a popular, free, and open-source debugger for C and C++ programs, which is widely used in Unix-like systems