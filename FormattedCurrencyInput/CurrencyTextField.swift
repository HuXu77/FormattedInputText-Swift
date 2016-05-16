//
//  CurrencyTextField.swift
//  FormattedCurrencyInput
//
//  Created by Mitchell Clay on 5/16/16.
//  Copyright © 2016 Peter Boni. All rights reserved.
//

import Foundation

class CurrencyTextField : UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(valueDidChange), name: UITextFieldTextDidChangeNotification, object: self)
    }
    
    func valueDidChange(sender : AnyObject) {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        var textFieldString = self.text
        textFieldString = textFieldString?.stringByReplacingOccurrencesOfString(numberFormatter.currencySymbol,
                                                              withString: "")
        textFieldString = textFieldString?.stringByReplacingOccurrencesOfString(numberFormatter.groupingSeparator,
                                                        withString: "")
        textFieldString = textFieldString?.stringByReplacingOccurrencesOfString(numberFormatter.decimalSeparator, withString: "")
        
        let textFieldNumber = NSDecimalNumber(string: textFieldString)
        let divideByNumber = NSDecimalNumber(int: 10).decimalNumberByRaisingToPower(numberFormatter.maximumFractionDigits)
        let textFieldTextNewNum = textFieldNumber.decimalNumberByDividingBy(divideByNumber)
        let textFieldNewNumberString = numberFormatter.stringFromNumber(textFieldTextNewNum)
        
        self.text = textFieldNewNumberString
    }
    
    func getValueAsNumber() -> NSNumber {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        
        var textFieldString = self.text!
        textFieldString = textFieldString.stringByReplacingOccurrencesOfString(numberFormatter.currencySymbol,
                                                                                withString: "")
        textFieldString = textFieldString.stringByReplacingOccurrencesOfString(numberFormatter.groupingSeparator,
                                                                                withString: "")
        
        let textNumber = NSDecimalNumber(string: textFieldString)
        
        return textNumber
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}