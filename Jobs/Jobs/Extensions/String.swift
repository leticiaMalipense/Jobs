//
//  String.swift
//  Jobs
//
//  Created by Leticia Malipense on 06/12/20.
//

import UIKit

extension String {

    // formatting text for currency textField
    func currencyInputFormatting() -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = ""
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
    
    
    func currencyToDouble() -> Double {
        var amount: String = self
        amount = amount.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ".", with: "")
                                                            .replacingOccurrences(of: ",", with: "")
        let converted:Double = Double(amount) ?? 0
        return converted > 0 ? converted / 100 : 0
    }
    
}
