//
//  DayView.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import SwiftUI

struct DayView: View {
    var dayModel: DayModel

    var body: some View {
        VStack(
            alignment: .center,
            spacing: 8
        ) {
            if let date = dayModel.date {
                let isToday =  date.isToday()
                let isWeekend = date.isWeekend()
                let hasEvent = dayModel.hasEvent
                let foregroundColor = isToday ? Color.white : isWeekend ? Color.red : Color.black
                

                Text("\(date.day())")
                    .padding(8)
                    .font(.system(size: 18))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Circle()
                        .fill( isToday ? Color.red : Color.white )
                        .frame(width: 35, height: 35, alignment: .center)
                    )
                if (hasEvent) {
                    Circle()
                        .fill(Color(UIColor.gray))
                        .frame(width: 8, height: 8)
                }
            }
            
                
        }
        .frame(width: 40, height: 55, alignment: .top)
        .padding(.vertical, 5)
    }
}


#Preview {
    VStack {
        DayView(dayModel: DayModel(Date()))
//            .background(Color.purple)
    }

}

