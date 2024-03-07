# Smart pointers

Smart Pointers are used to help ensure that programs are free of ``memory and resource leaks`` and are `exception-safe`.

### Problems with Normal Pointers
+ **Memory Leaks**: This occurs when memory is repeatedly allocated by a program but never freed. This leads to excessive memory consumption and eventually leads to a system crash. 
+ **Dangling Pointers**: A dangling pointer is a pointer that occurs at the time when the object is de-allocated from memory without modifying the value of the pointer.
+ **Wild Pointers**: Wild pointers are pointers that are declared and allocated memory but the pointer is never initialized to point to any valid object or address.
+ **Data Inconsistency**: Data inconsistency occurs when some data is stored in memory but is not updated in a consistent manner.
+ **Buffer Overflow**: When a pointer is used to write data to a memory address that is outside of the allocated memory block. This leads to the corruption of data which can be exploited by malicious attackers.

**Example:**
```cpp

#include <iostream>
using namespace std;
 
class Rectangle {
private:
    int length;
    int breadth;
};
 
void fun()
{
    Rectangle* p = new Rectangle();
}
 
int main()
{
    while (1) {
        fun();
    }
}
```

**Explanation**: In function fun, it creates a pointer that is pointing to the Rectangle object. The object Rectangle contains two integers, length, and breadth. When the function fun ends, p will be destroyed as it is a local variable. But, the memory it consumed won’t be deallocated because we forgot to use delete p; at the end of the function. That means the memory won’t be free to be used by other resources. But, we don’t need the variable anymore, we need the memory.

In function, main, fun is called in an infinite loop. That means it’ll keep creating p. It’ll allocate more and more memory but won’t free them as we didn’t deallocate it. The memory that’s wasted can’t be used again. Which is a memory leak. The entire heap memory may become useless for this reason.

### Types

- **auto_ptr**
    Using auto_ptr, you can manage objects obtained from new expressions and delete them when auto_ptr itself is destroyed. When an object is described through auto_ptr it stores a pointer to a single allocated object.
- **unique_ptr**
    unique_ptr stores one pointer only. We can assign a different object by removing the current object from the pointer. 
- **shared_ptr**
    By using shared_ptr more than one pointer can point to this one object at a time and it’ll maintain a Reference Counter using the use_count() method. 
- **weak_ptr**
    Weak_ptr is a smart pointer that holds a non-owning reference to an object. It’s much more similar to shared_ptr except it’ll not maintain a Reference Counter. In this case, a pointer will not have a stronghold on the object. The reason is if suppose pointers are holding the object and requesting for other objects then they may form a Deadlock. 