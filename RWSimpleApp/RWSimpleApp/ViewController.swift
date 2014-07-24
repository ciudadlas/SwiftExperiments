//
//  ViewController.swift
//  RWSimpleApp
//
//  Created by Serdar Karatekin on 7/24/14.
//  Copyright (c) 2014 Crispin Porter + Bogusky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    You’re prefixing these variables with the @IBOutlet keyword. Interface Builder scans your code looking for any properties in your view controller prefixed with this keyword. It exposes any properties it discovers so you can connect them to views.
//    You’re marking the variables with an exclamation mark (!). This indicates the variables are optional values, but they are implicitly unwrapped. This is a fancy way of saying you can write code assuming that they are set, and your app will crash if they are not set.
    
//    Implicitly unwrapped optionals are a convenient way to create variables you know for sure will be set up before you use them (like user interface elements created in the Storyboard), so you don’t have to unwrap the optionals every time you want to use them.
    
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Note: AnyObject is the equivalent of id in Objective-C. To learn more about AnyObject, check out our Swift Language FAQ.
    
    @IBAction func calculateTapped(sender: AnyObject) {
// Here’s how this works, in case you’re wondering.
// At the time of writing this tutorial, Swift’s String class does not have access to every method that NSString has (NSString is the string class in the Foundation framework). In particular, Swift’s String class does not have a method to convert to the string to a double; however NSString does.
// You can call bridgeToObjectiveC() method on a Swift String to convert it to NSString. Then, you can call any method that is available on NSString, such as a method to convert to a double.
// To learn more about the methods available on NSString, check out the NSString Class Reference.
        
//        Note: @BBK on the forums asked how you would sort the results by tip percentage. I thought that was a great question, so included the answer here.
//        Simply replace the for loop in section 3 with the following:
//        var keys = Array(possibleTips.keys)
//        sort(&keys)
//        for tipPct in keys {
//            let tipValue = possibleTips[tipPct]!
//            let prettyTipValue = String(format:"%.2f", tipValue)
//            results += "\(tipPct)%: \(prettyTipValue)\n"
//        }
//        You can get the keys in a dictionary (in this case, the tip percentages) with keys. They are not guaranteed to be in any order, so you have to sort them using the built in function sort which by default sorts by using the < operator (so numerical order).
//        Once you have the sorted keys, you can loop through them and pull out each item in the dictionary with the dictionary[key] syntax.
//        As @Solidath points out: "One important addition is that, the possibleTips[] dictionary access returns type Double?, not simply Double. That is because any Dictionary access (subscripting or using updateValue(forKey:) method) returns nil when the key is absent. In our case, we are sure that the key will have a value. For this, we put an exclamation mark "!" at the very end of the tipValue assignment, which is called forced unwrapping."
//        Also note you truncate the tip value to two percentage points, using an initializer on String that accepts a format string (like stringWithFormat in Objective-C). %.2f is a format string that formats a float value as a String, with 2 decimal places.
//        I hope this helps! :]
        
        
        tipCalc.total = Double(totalTextField.text.bridgeToObjectiveC().doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)% \(tipValue)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value)))%:"
        resultsTextView.text = ""
    }

}

