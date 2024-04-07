//
//  DateExtensions.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import Foundation

extension Date {
    
    // get day part of a date (Int)
    func day() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return Int(dateFormatter.string(from: self))!
    }
    
    
    // get month part of a date (Int)
    func month() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return Int(dateFormatter.string(from: self))!
    }
    
    
    // get year part of a date (Int)
    func year() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return Int(dateFormatter.string(from: self))!
    }
    
    
    // get localized month string of a date (String)
    func localizedMonthString() -> String {
        let calendar = Calendar.current
        return calendar.shortStandaloneMonthSymbols[self.month() - 1]
    }
    
    
    // get localized Year Month string of a date (String)
    func yearMonthString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MMMM"
        return dateFormatter.string(from: self)
    }
    
    
    // get weekday of a date (Int)
    // 0: Sunday
    func weekDay() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: self)
        return components.weekday! - 1
    }

    
    // get the number of days in the month of a date (Int)
    func daysInMonth() -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: self)!
        return range.count
    }
    
    
    // get the date of the first day in the month of a date (Date)
    func firstDayOfMonth() -> Date {
        let calendar = Calendar.current
        let date = Utility.dateFromString(month: self.month(), year: self.year(), day: 1)
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    
    // add days to current date (Date)
    func plusDate(_ count: Int = 1) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: count, to: self)!
    }
    
    
    // minus days from current date (Date)
    func minusDate(_ count: Int = 1) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: -count, to: self)!
    }
    
    
    // add months from current date (Date)
    func plusMonth(_ count: Int = 1) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: count, to: self)!
    }
    
    
    // minus months from current date (Date)
    func minusMonth(_ count: Int = 1) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: -count, to: self)!
    }

    
    // is the date today (Bool)
    func isToday() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let todayDateString = dateFormatter.string(from: Date())
        let dateToCompareString = dateFormatter.string(from: self)
        return (todayDateString == dateToCompareString)
    }
    
    
    // is the date a weekend (Bool)
    func isWeekend() -> Bool {
        let weekday = self.weekDay()
        return ((weekday == 0 ) || (weekday == 6))
    }
    
    
    // is the date in the same month as today (Bool)
    func isCurrentMonth() -> Bool {
        let today = Date()
        return (today.year() == self.year()) && (today.month() == self.month())
    }
    
}
