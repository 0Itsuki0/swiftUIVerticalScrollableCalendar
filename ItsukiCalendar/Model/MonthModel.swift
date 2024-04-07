//
//  MonthModel.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import Foundation


class MonthModel: Identifiable, Equatable {
    var id = UUID()
    
    var firstDayOfMonth: Date
    var dayModelList: Array<DayModel>
    
    init(_ firstDayOfMonth: Date) {
        let days = firstDayOfMonth.daysInMonth()
        
        // starting empty spaces
        let startingSpaces = firstDayOfMonth.weekDay()
        var dayModelList = Array(repeating: DayModel(nil), count: startingSpaces)

        // actual day in month
        var date = firstDayOfMonth
        dayModelList.append(DayModel(date))
        for _ in 1..<days {
            date = date.plusDate()
            dayModelList.append(DayModel(date))
        }
        
        // trailing empty spaces
        let monthRowCount = Int(ceil((Double(days + startingSpaces)/7)))
        let trailingSpaces = Array(repeating: DayModel(nil), count: monthRowCount * 7 - days - startingSpaces)
        dayModelList.append(contentsOf: trailingSpaces)
        
        self.firstDayOfMonth = firstDayOfMonth
        self.dayModelList = dayModelList
    }
    
    
    func numberOfRows() -> Int {
        let days = firstDayOfMonth.daysInMonth()
        let startingSpaces = firstDayOfMonth.weekDay()
        let monthRowCount = Int(ceil((Double(days + startingSpaces)/7)))
        return monthRowCount
    }
    
    
    static func == (lhs: MonthModel, rhs: MonthModel) -> Bool{
        return lhs.id == rhs.id
    }
}

