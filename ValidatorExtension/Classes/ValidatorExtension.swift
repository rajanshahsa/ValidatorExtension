//
//  Utilities.swift
//  CustomTextField
//
//  Created by rajan.shah on 21/02/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Date Class extension
public extension Date {
    /// Get text indicating time between caller date and passed date. *Send both dates with Time & both should be in same DateFormate*
    ///
    /// - Parameter serverDate: date recive from server or from DB
    /// - Returns: return text indicating time for ex: Years ago, Month ago, Weeks ago, Days ago, Hours ago, Minutes ago, secods Ago, Just now or Yesterday
    public func getDifferanceFromCurrentTime(serverDate : Date) -> String {
        var strTimeAgo = ""
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: serverDate, to: self)
        if components.year! >= 1{
            strTimeAgo = "\(components.year!) \(components.year == 1 ? "Year" : "Years")"
        }
        else if components.month! >= 1 {
            strTimeAgo = "\(components.month!) \(components.month == 1 ? "Month" : "Months") ago"
        }
        else if components.day! >= 7 {
            strTimeAgo = "\((components.day! / 7)) \(components.day!/7 >= 1 ? "Week" : "Weeks") ago"
        }
        else {
            if components.day == 0 {
                if components.hour! >= 1 {
                    strTimeAgo = "\(components.hour!) \(components.hour == 1 ? "Hour" : "Hours") ago"
                }
                else if components.minute! >= 1{
                    strTimeAgo = "\(components.minute!) \(components.minute == 1 ? "Minute" : "Minutes") ago"
                }
                else if components.second! >= 1 {
                    strTimeAgo = "\(components.second!) \(components.second == 1 ? "Second" : "Seconds") ago"
                }
                else {
                    strTimeAgo = "Just now"
                }
            }
            else if components.day! == 1{
                strTimeAgo = "Yesterday"
            }
            else {
                strTimeAgo = "\(components.day!) Days ago"
            }
        }
        return strTimeAgo
    }
}


// MARK: - String extension
public extension String {
    /// to trim string
    ///
    /// - Returns: return trim string
    public func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    /// For validating Email
    ///
    /// - Returns: return true if email id is valid else false
    public func isValidEmail() -> Bool {
        if self.isEmpty {
            return false
        }
        let laxString: String = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailRegex: String = laxString
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    /// Captialize first latter of string
    ///
    /// - Returns: String with frist latter capital
    public func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
}
