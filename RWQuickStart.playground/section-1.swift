// Playground - noun: a place where people can play

// Playgrounds are a great way to learn about Swift (like you’re doing in this Swift tutorial), to experiment with new APIs, to prototype code or algorithms, or to visualize your drawing code. In the rest of this Swift tutorial, you will be working in this playground.

import UIKit

var str = "Hello, playground"

let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

//  You may think to yourself, “why not just declare everything with var, since it’s less restrictive?”

//  Well, declaring things with let whenever possible is best practice, because that will allow the compiler to perform optimizations that it wouldn’t be able to do otherwise. So remember: prefer let!

// You may wonder if you should set types explicitly, or let the compiler infer the types for you. We believe it’s better practice to let the compiler infer types automatically where possible, because then you get one of the main advantages of Swift: concise and easy to read code.

let tutorialExplicitValue: Int = 56

// Float and Doubles
let priceInferred = 19.99
let priceExplicit: Double = 19.99

// There are two types for decimal point values like this: Float and Double. Double has more precision, and is the default for inferring decimal values. That means priceInferred is a Double too.

// Bools

let onSaleInferred = true
let onSaleExplicit: Bool = false

// Strings

let nameInferred = "Whoopie Cushion"
let nameExplicit: String = "Whoopie Cushion"

// This is an example of an if statement, just like you’d expect in different languages. The parentheses around the condition are optional, and braces are required even for 1-line statements

if onSaleInferred {
    println("\(nameInferred) on sale for \(priceInferred)")
} else {
    println("\(nameInferred) at regular price: \(priceInferred)")
}

// At this point, you may wonder where the println output of this code has gone. To see the println output, bring up the Assistant Editor with View\Assistant Editor\Show Assistant Editor.

//  Note that you do not necessarily need to subclass anything (unlike in Objective-C, where you must subclass NSObject or something that derives from NSObject).

// Note that any properties you declare must be set to an initial value when you declare them, or in your initializer – otherwise you’ll have to declare them as optional (more on that in a future tutorial).

// Initializers are always named init in Swift – you can have more than one if you want, but they need to take different parameters.

// Note that I have given the parameters of this method and the properties of this class the same names. Because of this, I need to distinguish between the two by putting the self prefix before the property names.

// Note that since there is no name conflict for the subtotal property, you don’t need to add the self keyword, because the compiler can automatically infer that.

// Note that when you call a method on an instance of a class, the first parameter does not need to be named (but the rest do).

// Note that [Double] is just a shortcut for Array<Double>.

// Note that [Int: Double] is just a shortcut for Dictionary<Int, Double>.

class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func printPossibleTips() {
        println("15%: \(calcTipWithTipPct(0.15))")
        println("18%: \(calcTipWithTipPct(0.18))")
        println("20%: \(calcTipWithTipPct(0.20))")
    }
    
    func printPossibleTipsWithArray() {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
        
        for possibleTip in possibleTipsInferred {
            println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
        }
        
//        for i in 0..<possibleTipsInferred.count {
//            let possibleTip = possibleTipsInferred[i]
//            println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
//        }
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
        
        var retVal = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPict = Int(possibleTip*100)
            retVal[intPict] = calcTipWithTipPct(possibleTip)
        }
        
        return retVal;
    }
}

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//tipCalc.printPossibleTipsWithArray()
tipCalc.returnPossibleTips()

// Note: You cannot call code from your app that resides in a Playground file. Playground files are just for testing and prototyping code; if you want to use code from a Playground in your app, you have to move it to a Swift file like you’re doing here.

// Unnamed Tuples

let inferredUnnamedTuple = (4.00, 25.19)
let explicitUnnamedTuple:(Double, Double) = (4.00, 25.19)

inferredUnnamedTuple.0
inferredUnnamedTuple.1

let (theTipAmt, theTotal) = inferredUnnamedTuple
theTipAmt
theTotal

// Named Tuples, this is a lot more convenient,
let tipAndTotalNamedInferred = (tipAmt: 4.00, total: 25.19)
tipAndTotalNamedInferred.tipAmt
tipAndTotalNamedInferred.total

let tipAndTotalNamedExplicit:(tipAmt: Double, total: Double) = (4.00, 25.19)
tipAndTotalNamedExplicit.tipAmt
tipAndTotalNamedExplicit.total


let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1)
func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}
calcTipWithTipPct(0.20)


// Protocols

// A protocol is a list of methods that specify a “contract” or “interface”.
// Any class that conforms to this protocol must implement this method.

protocol Speaker {
    func Speak()
}

class Vicki: Speaker {
    func Speak() {
        println("Speaking")
    }
}

class Ray: Speaker {
    func Speak() {
        println("Yo I am Ray")
    }
}

class Animal {
    
}

class Dog : Animal, Speaker {
    func Speak()  {
        println("I am a doggie")
    }
}

// In this example, Dog inherits from Animal, so when declaring Dog you put a :, then the class it inherits from, then list any protocols. You can only inherit from 1 class in Swift, but you can conform to any number of protocols.

// You can mark methods in a protocol as being optional.

// If you want to have a protocol with optional methods, you must prefix the protocol with the @objc tag (even if your class is not interoperating with objective-C). Then, you prefix any method that can be optional with the optional tag.

@objc protocol Speaker2 {
    func Speak()
    optional func TellJoke()
}

class Vicki2: Speaker2 {
    func Speak() {
        println("Hello, I am Vicki!")
    }
    func TellJoke() {
        println("Q: What did Sushi A say to Sushi B?")
    }
}

class Ray2: Speaker2 {
    func Speak() {
        println("Yo, I am Ray!")
    }
    func TellJoke() {
        println("Q: Whats the object-oriented way to become wealthy?")
    }
    func WriteTutorial() {
        println("I'm on it!")
    }
}

// Note that rather than declaring speaker as Ray, you declare it as speaker. This means you can only call methods on speaker that exist in the Speaker protocol, so calling WriteTutorial would be an error even though speaker is actually of type Ray. You can call WriteTutorial if you cast speaker back to Ray temporarily though, as you see here.

// Also note that you can set speaker to Vicki as well, since Vicki also conforms to Speaker.


var speaker: Speaker2
speaker = Ray2()
speaker.Speak()
// speaker.WriteTutorial() // error

(speaker as Ray2).WriteTutorial()
speaker = Vicki2()
speaker.Speak()

speaker.TellJoke?()


// Remember that TellJoke is an optional method, so before you call it you should check if it exists.
// These lines use use a technique called optional chaining to do this. If you put a ? mark after the method name, it will check if it exists before calling it. If it does not exist, it will behave as if you’ve called a method that returns nil.
// Optional chaining is a useful technique anytime you want to test if an optional value exists before using it, as an alternative to the if let (optional binding) syntax discussed earlier. You will be using this much more in the rest of this series and other Swift tutorials on this site.




// Delegates

// A delegate is simply a variable that conforms to a protocol, which a class typically uses to notify of events or perform various sub-tasks. Think of it like a boss giving his minion status updates, or asking him/her to do something!

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker2, b: Speaker2)
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker2, b: Speaker2)
}

class DateSimulator {
    let a: Speaker2
    let b: Speaker2
    
    var delegate:DateSimulatorDelegate?
    
    init(a: Speaker2, b: Speaker2) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        
        println("Off to dinner")
        a.Speak()
        b.Speak()
        println("Welcome back home")
        a.TellJoke?()
        b.TellJoke?()
        
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
    }
}


// Imagine you want to be able to notify another class when the date begins or ends. This could be useful if you wanted to make a status indicator in your app appear or disappear when this occurs, for example.
// To do this, first create a protocol with the events you want to notify, like so (add this before DateSimulator):



class LoggingDateSimulator: DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker2, b: Speaker2) {
        println("DATE STARTED /delegate")
    }

    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker2, b: Speaker2)  {
        println("DATE ENDED /delegate")
    }
}


let sim = DateSimulator(a: Vicki2(), b: Ray2())
sim.delegate = LoggingDateSimulator()

sim.simulate()















