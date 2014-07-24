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



