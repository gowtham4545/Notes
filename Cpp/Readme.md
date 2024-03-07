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