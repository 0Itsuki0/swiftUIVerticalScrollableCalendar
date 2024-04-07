//
//  Utility.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/07.
//

import Foundation

class Utility {
    
    // A list of very-shortly-named weekdays in this calendar, localized to the Calendar’s locale.
    // ex: for English in the Gregorian calendar, returns ["S", "M", "T", "W", "T", "F", "S"]
    static func weekdaySymbols() -> [String] {
        let calendar = Calendar.current
        return calendar.veryShortStandaloneWeekdaySymbols
    }
    
    
    static func dateFromString(month: Int, year: Int, day: Int) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: "\(addPadding(year, 4))/\(addPadding(month, 2))/\(addPadding(day, 2))")!
    }
    
    
    private static func addPadding(_ int: Int, _ targetDigit: Int ) -> String {
        return String(format: "%0\(targetDigit)d", int)
    }
}
