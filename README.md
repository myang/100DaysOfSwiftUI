## Day 1 - Day 4
*  variables, simple data types, and string interpolation
*  arrays, dictionaries, sets, and enums

1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
2. Arrays store items in the order you add them, and you access them using numerical positions.
3. Sets store items without any order, so you can’t access them using numerical positions.
4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
5. Dictionaries store items according to a key, and you can read items using those keys.
6. Enums are a way of grouping related values so you can use them without spelling mistakes.
7. You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
* operators and conditions

* Optinal value
An optional value either contains a value or contains nil to indicate that a value is missing. "if let" can be used to handle the optinal value:
```
if let name = optionalName {
    greeting = "hello, \(name)" // only if name is not nil
} 
```
## Looping
* Break outer label

## Function
* Return type: -> Int
* square(number: 5)
* sum(up num : Int) sum(up: 5)
* sum(num: Int = 0) sum()
* variadic funtions
* add(num: inout Int) add(num: &a)
* throw, do try catch 

## Types
* var number = 2021.0404 the default type is Double, not Float

## Closure
* tail syntax
* return a closure with its own parameters

## Protocol and Extension
* Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
* You can build protocols on top of other protocols, similar to classes.
* Extensions let you add methods and computed properties to specific types such as Int.
* Protocol extensions let you add methods and computed properties to protocols (as default implementation).

## Struct
* Self points to whatever instance of the struct is currently being used.
* Prefer using struct over class.
* mutating, init(), static, private
* value type, different from a class which is a reference type

## Class
* SwiftUI uses structs extensively for its UI design.
* It uses classes extensively for its data: when you show data from some object on the screen, or when you pass data between your layouts, you’ll usually be using classes.
* classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer: init().
* always call super.init() from child class init()
* use override fnnc
* copying a class both point to the same class
* a constant class with a variable property, that property can be changed. Because struct is treated like a value, if you change part of it, the whole struct will be changed. But a class is allocated in heap memory. So its variable properties can be changed even the class is a constant.

## Optional
* use try? to convert the throwable function to optional: if let num = try? num else {}.
* use try! when you are sure the function will not throw
* typecasting: 
```
if let dog = pet as? Dog {
     dog.makeNoise()
}
```
## Review
* struct/class property observer: willSet{}, didSet{}
* computed property (run code to figure out its value): var age: Int{ get{... return age*7} }
* access control:
  * **Internal**: within the app
  * **File Private**: within the source file
  * **Private**: within the type or its extensions
  * **Closure**: trailing closure: call a func: func1() {...} 
  * **Protocol**: no implementation
  * **Extension**: provide default implementation to types and protocols.

## WeSplit

