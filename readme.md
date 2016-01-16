# The __ Programming Language

> **Note**: This language is not actually called __, 
  I just don't have a name for it yet. Feel free to 
  call it that or "language X" until it gets a real 
  name.

## Why another language?
This isn't meant to be a language to change the world
or revolutionize the way we program. I just like programming
linguistics. This is a language made up of everything
I've come to enjoy in certain languages over the years.

## What is different about this language?
Really, not a whole lot. Apart from the lack of a lot of
syntactic tokens, and the ability to dynamically change
the language, there isn't much in the way of [*oh wow
that's a crazy language that has never been done before
I can't believe this is real life*](http://urbit.org/). This
is meant to be a fast, powerful, general purpose language.
You are meant to write _real_ software with this, not
some crazy language that only has a couple use cases.

## Let's see it!
Prepare your eyeballs. (_Comments are after `//`_)

```javascript
add (a, b) = a + b
print add 5, 6 // print(add(5,6))

multiply (a, b) = {
    int t // initialized to 0
    i = b // create new variable i with the type and value of b
    while i-- > 0 {
        t += a
    }
    t // return the value of the last statement
}
print multiply 7, 2 // 14
print multiply add(2,3), 5 // 25; add parentheses where needed

print ((a,b) = -a * b) 2, 4 // -8; complicated lambda

object O {
}
O obj //create object O

object B {
    //local field can be retrieved from outside the object
    int i
    //constructors use `this` are can take however many arguments you give it
    this() = {}
}

B objB = B() // objects are initialized like methods, an empty () is
             // not required when there are no arguments
B objB2 = B //same as above

object Data {
    // @ in arguments can only be used in an object's constructor
    // it will assign a local variable of that name to the value passed in
    this(int @a, char @c) = {}
}

Data d = Data 7, 'd' // using method invocation syntax
print d.a // 7
print d.c // d
```