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

#### Explicit conversion

```cpp
int main(){
    int i='x'; //implicit conversion from char to asci int
    explicit int j='d'; // shows error, bcz declared as explicit variable and doesn't allow \
    implicit conversion
}
```

#### Smart pointers

Smart Pointers are used to help ensure that programs are free of `memory and resource leaks` and are `exception-safe`.

View more about this [here](./smart_pointer.md)

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

**Format-Style `print()`**

```cpp
#include<format>
using namespace std;

constexpr void print(const string_view str_fmt, auto&&... args){
    fputs(vformat(str_fmt, make_format_args(args...)).cstr(), stdout);
}

int main(){
    int i=5;
    print("{}\n",i); // This works exactly like printf( format( "{}\n", i ));
}
```

