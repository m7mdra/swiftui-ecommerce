//
//  UTextView.swift
//  ecom
//
//  Created by mega on 23/11/2021.
//

import SwiftUI

struct UTextView: View {
    var iconName:String
    var label:String
    var secure:Bool = false
    var body: some View {
        HStack(alignment:.center){
            Image(iconName)
                
                .foregroundColor(Colors.raven.swiftUiColor)
            VStack(alignment:.leading,spacing: 3){
                Text(label.uppercased()).font(.caption)
                    .foregroundColor(Colors.comet.withAlphaComponent(0.5).swiftUiColor)
                    .padding(.top,4)
                if !secure{
                    TextField("", text: .constant("Hello"))
                        .padding(.bottom)
                }else{
                    SecureField("",text: .constant("heelo"))
                        .padding(.bottom)

                }
            }
        }.listRowSeparator(.hidden)
    }
}

struct UTextView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            UTextView(iconName: "profile", label: "Username")
            UTextView(iconName: "ic_mail", label: "Email")
            UTextView(iconName: "lock", label: "Passowrd",secure: true)
            
        }
        
    }
}
