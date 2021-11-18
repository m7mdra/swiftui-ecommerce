//
//  OutlinedButton.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct OutlinedButton : View{
    var text:String
    var action:()->Void
    init(text:String,action:@escaping ()->Void) {
        self.text = text
        self.action = action
    }
    var body: some View{
        Button (action:action, label: {
            Text(text.uppercased())
                .bold()
                .foregroundColor(Colors.raven.swiftUiColor)
        })  .padding(.vertical,8)
            .padding(.horizontal,25)

            .overlay(
                RoundedRectangle(cornerRadius: 24).stroke(Color(Colors.grey.withAlphaComponent(0.4)), lineWidth: 1.5)
                
                )

    }
}

struct OutlinedButton_Previews: PreviewProvider {
    static var previews: some View {
        OutlinedButton(text: "EDIT PROFILE") {
            
        }
    }
}

