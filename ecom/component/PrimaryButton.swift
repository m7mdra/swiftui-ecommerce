//
//  PrimaryButton.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct PrimaryButton : View{
    var title:String
    var action:()->Void

    
    var body: some View{
        return Button(action: action, label: {
            HStack{
                Spacer()
                Text(title.uppercased())
                    .bold()
                Spacer()
                Image("arrow_circle", bundle: Bundle.main)

            }
        }).padding(.all,13)
            .background(Color(Colors.accent))
            .foregroundColor(Color.white)
            .cornerRadius(23)
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 10, x: 0, y: 5)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title:"SIGN UP"){
            
        }
    }
}
