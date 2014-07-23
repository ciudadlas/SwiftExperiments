// Playground - noun: a place where people can play

// Guide: https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-XID_1

// http://www.techworld.com.au/slideshow/547259/pictures-10-prominent-features-stolen-by-apple-swift-where-they-came-from/

// http://www.huffingtonpost.com/ahmed-eid/apples-swift-is-great-but_b_5492239.html



import UIKit

println("Hello, world")

///////////////////
// SIMPLE VALUES //
///////////////////

// Use let to make a constant and var to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.

// “A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that myVariable is an integer because its initial value is a integer.”

// To create a variable use ‘var‘. var is mutable.
// To create constant use ‘let‘. ‘let’ is immutable.

var k = 42 // Variable
k = 100
let constant = 1230 // Constant

let implicitInteger = 70
let implicitDouble = 70.0

// “If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.”

let explicitDouble: Double = 70
let eplicitFloat : Float = 4

// “Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.”

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

// “There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (\) before the parentheses. For example:”

let apples = 3
let oranges = 3
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let someonesName = "Mr. X has \(3+5.4) apples"

// “Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets.”

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

occupations["Jayne"] = "Public Relations"

// “To create an empty array or dictionary, use the initializer syntax.”

let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()

// “If type information can be inferred, you can write an empty array as [] and an empty dictionary as [:]—for example, when you set a new value for a variable or pass an argument to a function.”

shoppingList = [] // Went shopping and bought everything

//////////////////
// CONTROL FLOW //
//////////////////

// “Use if and switch to make conditionals, and use for-in, for, while, and do-while to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.”

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

// “In an if statement, the conditional must be a Boolean expression—this means that code such as if score { ... } is an error, not an implicit comparison to zero.”


// “You can use if and let together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains nil to indicate that the value is missing. Write a question mark (?) after the type of a value to mark the value as optional.”

// “If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.”

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, unknown name"
}


var notOptionalString = "Test"
// notOptionalString = nil

// “Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.”
// “After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.”

let vegetable = "red pepper"

switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich"
    
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x) ?"
    
    default:
        let vegetableComment = "Everything tastes good in soup"
}

// “You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.”

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var largestNumberKind : String? = nil;

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestNumberKind = kind
        }
    }
}

largest
largestNumberKind

// “Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.”

var n = 2
while n < 100 {
    n = n * 2
}
n


var m = 2
do {
    m = m * 2
} while m < 100
m

// “You can keep an index in a loop—either by using ..< to make a range of indexes or by writing an explicit initialization, condition, and increment. These two loops do the same thing:”

// “Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.”

var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop


var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop


var thirdForLoop = 0
for i in 0...3 {
    thirdForLoop += i
}
thirdForLoop

////////////////////////////
// FUNCTIONS AND CLOSURES //
////////////////////////////

// “Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.”

func greet(name: String, lunchSpecial: String) -> String {
    return "Hello \(name), today's lunch special is \(lunchSpecial)"
}

greet("Bob", "Grilled Tuna")


// Use a tuple to make a compound value—for example, return multiple values from a function. The elements of a tuple can be referred to either by name or by number.

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
statistics.sum
statistics.2

// Functions can also take a variable number of arguments, collecting them into an array.

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(13, 2, 13)

func averageOf(numbers: Int...) -> Double {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return Double(sum / numbers.count)
}

averageOf(13, 2, 12)
averageOf(124,1241,124,124,124)


// “Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.”

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    return y
}
returnFifteen()


// “Functions are a first-class type. This means that a function can return another function as its value.”

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// “A function can take another function as one of its arguments.”

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [23, 1, 234, 23]
hasAnyMatches(numbers, lessThanTen)

// Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })


numbers.map({
    (number: Int) -> Int in
    var result = 0
    if (number % 2 == 0) {
        result = 3 * number
    }
    return result
})

// You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.

let mappedNumbers = numbers.map({ number in 3 * number })
mappedNumbers

// You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses.

let sortedNumbers = sorted(numbers) {$0 > $1}
sortedNumbers

/////////////////////////
// OBJECTS AND CLASSES //
/////////////////////////

// Use class followed by the class’s name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.

class Shape {
    var numberOfSides = 0
    let numberOfCorners = 10
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func shapeOwnerLabel(ownerName: String) -> String {
        return "This shape's owner is \(ownerName)."
    }
}

// Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance.

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//Notice how self is used to distinguish the name property from the name argument to the initializer. The arguments to the initializer are passed like a function call when you create an instance of the class. Every property needs a value assigned—either in its declaration (as with numberOfSides) or in the initializer (as with name).

//Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides, and name \(name)"
    }
}

var namedShape = NamedShape(name: "Serdar")
namedShape.simpleDescription()

//Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

//Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass.

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let testSquare = Square(sideLength: 23.4, name: "MySquare")
testSquare.area()
testSquare.simpleDescription()


class Circle: NamedShape {
    var radius: Double
    
    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double {
        return radius * radius * 3.14
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius) and area \(area())"
    }
}
let testCircle = Circle(name: "MyCircle", radius: 24.3)
testCircle.simpleDescription()

// In addition to simple properties that are stored, properties can have a getter and a setter.
// In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.

// In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.
//
// Notice that the initializer for the EquilateralTriangle class has three different steps:
//
// Setting the value of properties that the subclass declares.
// Calling the superclass’s initializer.
// Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var testTriangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
testTriangle.perimeter
testTriangle.perimeter = 9.9
testTriangle.sideLength


// If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "Another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "Larger square")
triangleAndSquare.triangle.sideLength

// Methods on classes have one important difference from functions. Parameter names in functions are used only within the function, but parameters names in methods are also used when you call the method (except for the first parameter). By default, a method has the same name for its parameters when you call it and within the method itself. You can specify a second name, which is used inside the method.

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 4)

// When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

/////////////////////////////////
// Enumerations and Structures //
/////////////////////////////////

// Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.

// In the example above, the raw value type of the enumeration is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration.

enum Rank : Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
let aceSimpleDescription = ace.simpleDescription()

// Write a function that compares two Rank values by comparing their raw values.

func compareRanks(value1: Rank, value2: Rank) -> Bool {
    return value1.toRaw() > value2.toRaw()
}

// Use the toRaw and fromRaw functions to convert between the raw value and the enumeration value.

if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}

// The member values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.

// Notice the two ways that the Hearts member of the enumeration is referred to above: When assigning a value to the hearts constant, the enumeration member Suit.Hearts is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration is referred to by the abbreviated form .Hearts because the value of self is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

class Deck {
    var cards = [Card]()
    
    init() {
        for rawRank in Rank.Ace.toRaw()...Rank.King.toRaw() {
            cards += [
                Card(rank: Rank.fromRaw(rawRank)!, suit: Suit.Clubs),
                Card(rank: Rank.fromRaw(rawRank)!, suit: Suit.Diamonds),
                Card(rank: Rank.fromRaw(rawRank)!, suit: Suit.Spades),
                Card(rank: Rank.fromRaw(rawRank)!, suit: Suit.Hearts)
            ]
        }
    }
}

var deck = Deck()
deck.cards.count + 1
deck.cards[0].suit.simpleDescription()
deck.cards[0].rank.simpleDescription()



// An instance of an enumeration member can have values associated with the instance. Instances of the same enumeration member can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration member is the same for all of its instances, and you provide the raw value when you define the enumeration.

// For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.

// Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6 am", "8.09 am")
let failure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure \(error)"
}


//////////////////////////////
// Protocols and Extensions //
//////////////////////////////

// Use protocol to declare a protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations, and structs can all adopt protocols.

// Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.

class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A very simple case"
    var anotherProperty: Int = 69105
    func adjust()  {
        simpleDescription += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


enum SimpleEnumaration : ExampleProtocol {
    case Base, Adjusted
    
    var simpleDescription: String {
    switch self {
    case .Base:
        return "Switch is base"
    case .Adjusted:
        return "Switch is adjusted"
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .Base:
            return "A simple description of enum"
        case .Adjusted:
            return "Adjusted description of enum"
        default:
            return "Default description"
        }
    }
    mutating func adjust()  {
        self = SimpleEnumaration.Adjusted
    }
}

var c = SimpleEnumaration.Base
c.simpleDescription
c.adjust()
c.simpleDescription

// Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.


extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription


extension Double {
    var absoluteValue: Double {
        return fabs(self)
    }
}

var extendedDouble = -123.1234
extendedDouble.absoluteValue

// You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.

// Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.

let protocolValue: ExampleProtocol = a;
protocolValue.simpleDescription

//////////////
// Generics //
//////////////

// Write a name inside angle brackets to make a generic function or type.
func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0..<times {
        result += item
    }
    return result
}

repeat("knock", 4)

// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)


// Use where after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

// In the simple cases, you can omit where and simply write the protocol or class name after a colon. Writing <T: Equatable> is the same as writing <T where T: Equatable>.

func anyCommonElements <T, U where
    T: Sequence,
    U: Sequence,
    T.GeneratorType.Element: Equatable,
    T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
        
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                println(rhsItem)

                return true
            }
        }
    }
        
    return false
}

anyCommonElements([1, 2, 3], [3, 2])
anyCommonElements([123, 4, 5], [3, 7])

// Modify the anyCommonElements function to make a function that returns an array of the elements that any two sequences have in common.

func commonElements <T, U where
    T: Sequence,
    U: Sequence,
    T.GeneratorType.Element: Equatable,
    T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> [T.GeneratorType.Element] {
        
    var commonElements = Array<T.GeneratorType.Element>()
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
    
    return commonElements
}

commonElements([1, 2, 3], [3, 2])


