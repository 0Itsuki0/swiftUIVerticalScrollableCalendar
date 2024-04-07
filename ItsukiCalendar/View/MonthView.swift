//
//  MonthView.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/06.
//

import SwiftUI

struct MonthView: View {
    var monthModel: MonthModel
    
    @State var leadingPadding: CGFloat?
    
    
    var body: some View {
        let coordinateSpaceName: String = "monthViewVStack"

        let firstDayOfMonth = monthModel.firstDayOfMonth
        let startingSpaces = firstDayOfMonth.weekDay()

        let isCurrentMonth = firstDayOfMonth.isCurrentMonth()

        VStack(
            alignment: .center,
            spacing: 10
        ) {
            if let leadingPadding = leadingPadding {
                // month label
                Text("\(firstDayOfMonth.localizedMonthString())")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .fontWeight(
                        Font.Weight.bold
                    )
                    .foregroundStyle(
                        isCurrentMonth ? Color.red : Color.black
                    )
                    .padding(.leading, leadingPadding + 5)
                    .foregroundStyle(Color.red)
            }

            // days
            ForEach(0..<monthModel.numberOfRows(), id: \.self) { row in
                HStackWithPadding(
                    leadingPadding: 10,
                    trailingPadding: 10
                ){
                    ForEach(0..<7) { column in
                        let dayIndex = column + (row * 7)
                        let dayModel = monthModel.dayModelList[dayIndex]
                       
                        DayView(dayModel: dayModel)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .overlay(GeometryReader{ geometry -> Color in
                                if (dayIndex == startingSpaces) {
                                    DispatchQueue.main.async {
                                        leadingPadding  = geometry.frame(in: .named(coordinateSpaceName)).minX
                                    }
                                }
                                
                                return Color.clear
                            })
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .coordinateSpace(name: coordinateSpaceName)

    }
    
}









#Preview {
    VStack {
        MonthView(monthModel: MonthModel(Date().firstDayOfMonth()))
            .background(Color.blue)
//        HStackWithPadding {
//            Text("hey")
//        }
        
        
//        MonthView(monthMoel: MonthModel( Date().firstDayOfMonth().plusMonth().plusMonth()))
    }
//        .background(Color.blue)
//        DayView(isSelected: false, hasEvents: true, date: 5)
//            .background(Color.purple)
//
//        DayView(isSelected: true, hasEvents: true, date: 5)
//            .background(Color.purple)

//    }

}
