# __ Language Specification
This is the specification for the __ Programming Language.

## Data Types
There are two categories of data types, primitives and objects.
This is different from languages like Java, where primitives are
objects. In __, primitives are _not_ objects. This prevents a
lot of overhead from autoboxed objects w/ lots of methods, fields,
etc. Here's an example:

```javascript
object Integer { // int wrapper
    this(int @i) = {}
}
int a = 7
Integer b = Integer(a)
Integer c = Integer(b) // XXX: type error
Integer d = Integer(b.i) // ok, uses `int`
```

## Scope
Within each block is a new scope, which you can define new
variables and functions. These variables and functions can't
be used outside their scope, unless they are in the global scope.

```javascript
a = 7
{
    b = 9
    print b - a // local variable - global variable
    c(int i) = i + 2 // local function
    print c a // 9
}
print c a // XXX: function not found
```

### Multiple Files
Files can be imported using `import`, along with the name
of the file you want to import.

```javascript
//io.__ file
h() = print "Hello, World!" // global function
```

```javascript
//other.__ file
import io // `import` followed by identifier
h() // call global function
```

### Namespaces
`namespace` followed by an identifier will create namespace.
All the functions, variables, and objects within it will only be
accessible from this namespace.

```javascript
namespace io {
    out(s) = print s
    string s = "Hello"
}

io::out io::s // prints `Hello`
```

### Access Modifiers
There are none! Everything is public!

## Control Flow
### If/Else Statements
_If_ statements take one boolean and run the block after them.
_Else_ statements will run if their accompanying If is false.
Combine these to make an _Else If_ statement.

```javascript
a = 8
b = 9

if a == 8 {
    print "This runs"
} else if b == 6 {
    print "Nope"
} else {
    print "Not here"
}
```

## Variables
Variables are declared with their type in front of them, but it
is not needed when a value is assigned to it.
```javascript
int a = 7 // variable a of type int set to 7
b = 8 // variable b of type int set to 8
int c // initialized to 0
```

## Functions
Functions are made by `identifier ([type identifier]..) = {block}`.

```javascript
a (int m) = {
    print m
}

// Brackets are optional for one-liners
b (int m) = print m
```

To call a function, use the name and put ny arguments after it
separated by commas.

```javascript
a 7 // prints `7`
a(7) // parens are optional

add (int a, int b) = a + b
p (int a) = print a
p add 5, 6 // p( add( 5, 6 ))

man (int hair, int body) = print "Hair: " + hair + " Body: " + body
man add(7, 6), add 7, 8 // use parens where needed
```

The last expression of a function is returned if needed.

```
wow (int such, int many) = {
    while many < 7 {
        such--
        many++
    }
    such + many // returned value
}
```

If a function has no arguments, you need to use parens.

```
p() = print "wow"

p() // called
p  // error
```

## Objects
Objects are create by `object identifier {block}`.
All functions inside an object become methods for
that object. All variables inside an object become
fields for that object. Since everything is public,
there is no need for getters and setters.

```
object InternetAddress {
    int port
    string host
}

InternetAddress ia = InternetAddress() // called like a function
ia.port = 404 // setting fields
ia.host = "localhost"
```

### Constructors
Constructors are made with a special function call `this`.

```
object Data {
    int a
    int b
    this(int c, int d) = {
        a = c
        b = d
    }
}

Data d = Data(7, 8)
print d.a // 7
```