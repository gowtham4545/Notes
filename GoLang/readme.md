# GoLang

## Interface

```go
package main

import "fmt"

// Define an interface Animal (similar to a base class)
type Animal interface {
    Speak() string
}

// Define a struct Dog that "inherits" from Animal
type Dog struct {
    Name string
}

// Implement the Animal interface
func (d Dog) Speak() string {
    return "Woof!"
}

// Define a struct Cat that also implements Animal
type Cat struct {
    Name string
}

// Implement the Animal interface
func (c Cat) Speak() string {
    return "Meow!"
}

func main() {
    animals := []Animal{Dog{Name: "Buddy"}, Cat{Name: "Whiskers"}}
    for _, animal := range animals {
        fmt.Println(animal.Speak()) // Output: Woof! Meow!
    }
}

```

## OOPs in Go

### Composition

<pre>Composition in Go is a way to share logic and data between structs without using inheritance.
Here's a breakdown:</pre>

- **Struct Inclusion:** *You include one struct within another as an attribute, which can be named or unnamed.*
- **Shared Methods:** *Methods of the included struct appear as though they are part of the containing struct, allowing shared behavior.*
- **Common Patterns:** Useful for common patterns across multiple structs, like audit logic in database tables.

```go
type animal struct{
    lastAte time.Time
}

func (a *animal) feed(food string) string {
    a.lastAte = time.Now()
    return fmt.Sprintf("The animal is eating %s", food)
}

func (a *animal) isHungry() bool {
    return time.Now().Sub(a.lastAte) > 2 * time.Second
}

type dog struct {
    animal
    name string
}

func main() {
    pet := dog{
        animal: animal{lastAte: time.Now()},
        name: "Buddy",
    }

    if pet.isHungry() {
        fmt.Println(pet.feed("kibble"))
    } else {
        fmt.Println("Your animal isn't hungry, waiting.")
    }
}
```

### Encapsulation

<pre>Encapsulation in Go, as discussed in the course, is about bundling the data (fields) and methods
(functions) that operate on the data into a single unit, typically a struct. Here are the key points:</pre>

- **Private Fields:** *Fields in a struct can be made private by starting their names with a lowercase letter. This restricts access to these fields from outside the struct, ensuring that they can only be modified through methods provided by the struct.*
- **Public Methods:** *Methods that operate on the struct's data can be made public by starting their names with an uppercase letter. These methods provide controlled access to the private fields, maintaining the integrity of the data.*
