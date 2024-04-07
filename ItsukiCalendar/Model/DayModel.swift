//
//  DayModel.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import Foundation


struct DayModel: Identifiable {
    var id: UUID = UUID()
    
    var date: Date?
    var hasEvent: Bool
    
    init(_ date: Date?) {
        self.date = date
        self.hasEvent = date?.day().isMultiple(of: 5) ?? false
    }
    
}
