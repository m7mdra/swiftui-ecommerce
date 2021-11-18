//
//  ShareButton.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI


struct ShareButton : View{
    var title:String
    var action:()->Void

    
    var body: some View{
        return Button(action: action, label: {
            HStack{
                Text(title.uppercased())
                    .bold()
                    .padding(.horizontal,4)
                
                Image("share", bundle: Bundle.main)

            }
        }).padding(.all,12)
            .background(Color.white)
            .foregroundColor(Color(Colors.grey))
            .cornerRadius(23)
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.1)), radius: 10, x: 0, y: 5)
        
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(title:"SHARE THIS"){
            
        }
    }
}

