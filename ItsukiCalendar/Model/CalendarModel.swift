//
//  CalendarModel.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import SwiftUI

class CalendarModel: ObservableObject {
    @Published var monthList: [MonthModel]
    
    init() {
        let today = Date()
        let firstDayOfCurrentMonth = today.firstDayOfMonth()
        var firstDayOfMonth = firstDayOfCurrentMonth.minusMonth(5)
        
        var monthList: [MonthModel] = [MonthModel(firstDayOfMonth)]

        for _ in 0..<11 {
            firstDayOfMonth = firstDayOfMonth.plusMonth()
            monthList.append(MonthModel(firstDayOfMonth))
        }
        
        self.monthList = monthList
    }
    
    func idForCurrentMonth() ->  UUID {
        let today = Date()
        let firstDayOfCurrentMonth = today.firstDayOfMonth()

        let currentMonth = monthList.filter {$0.firstDayOfMonth == firstDayOfCurrentMonth}
        if (currentMonth.isEmpty) {
            return UUID()
        } else {
            return currentMonth[0].id
        }
    }
    
    func monthModelFromId(_ id: UUID?) -> MonthModel {
        if id == nil {
            return MonthModel(Date().firstDayOfMonth())
        }
        return monthList.first(where: {$0.id == id }) ?? MonthModel(Date().firstDayOfMonth())
    }
    
    
    func addMonthAfter(_ count: Int) async {
        sleep(1)

        var firstDayOfLastMonth = monthList.last?.firstDayOfMonth ?? Date().firstDayOfMonth()
        for _ in 0..<count {
            firstDayOfLastMonth = firstDayOfLastMonth.plusMonth()
            let monthModel = MonthModel(firstDayOfLastMonth)
            DispatchQueue.main.async {
                self.monthList.append(monthModel)
            }
        }

    }
    
    func addMonthBefore(_ count: Int) async {
        sleep(1)
        var firstDayOfFirstMonth = monthList.first?.firstDayOfMonth ?? Date().firstDayOfMonth()
        for _ in 0..<count {
            firstDayOfFirstMonth = firstDayOfFirstMonth.minusMonth()
            let monthModel = MonthModel(firstDayOfFirstMonth)
            DispatchQueue.main.async {
                self.monthList.insert(monthModel, at: 0)
            }
        }

    }
}


