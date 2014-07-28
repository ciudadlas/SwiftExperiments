//
//  TipCalculatorModel.swift
//  RWSimpleApp
//
//  Created by Serdar Karatekin on 7/24/14.
//  Copyright (c) 2014 Crispin Porter + Bogusky. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    
    // A computed property does not actually store a value. Instead, it is computed each time based on other values. Here, you calculate the subtotal each time it is accessed based on the current values of total and taxPct.
    var subtotal: Double {
    get {
        return total / (taxPct + 1)
    }
    set {
        
    }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func calcTipWithTipPctTuple(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
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
    
    func returnPossibleTipsTuple() -> [Int: (tipAmt:Double, total:Double)] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPctTuple(possibleTip)
        }
        return retval
    }
}
