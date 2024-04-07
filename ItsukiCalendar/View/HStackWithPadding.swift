//
//  HStackWithPadding.swift
//  ItsukiCalendar
//
//  Created by Itsuki on 2024/04/07.
//

import SwiftUI


struct HStackWithPadding<Content>: View where Content: View  {

    var leadingPadding: CGFloat?
    var trailingPadding: CGFloat?

    @ViewBuilder var content: Content
    
    var body: some View {
        HStack(
            alignment: .center
        ) {
            Spacer()
                .frame(width: leadingPadding ?? 0, height: 10, alignment: .center)
//                .background(Color.white)
            
            content
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
                .frame(width: trailingPadding ?? 0, height: 10, alignment: .center)
//                .background(Color.white)

        }
    }
}
