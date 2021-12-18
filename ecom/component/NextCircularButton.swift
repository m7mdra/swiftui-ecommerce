//
//  NextCircularButton.swift
//  ecom
//
//  Created by mega on 19/11/2021.
//

import SwiftUI

struct NextCircularButton : View{
    var body: some View{
        ZStack(alignment:.center){
            Circle()
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
        Image(systemName: "chevron.right")
            .foregroundColor(Colors.accent.swiftUiColor)
        }.shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 18, x: 0, y: 5)
    }
}
struct NextCircularButton_Previews: PreviewProvider {
    static var previews: some View {
        NextCircularButton()
    }
}
