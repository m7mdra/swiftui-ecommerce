//
//  SeeMoreButton.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI
struct SeeMoreButton : View{
    var title:String
    var action:()->Void

    
    var body: some View{
        return Button(action: action, label: {
            HStack{
                Text(title.uppercased())
                    .fontWeight(.regular)
                    .padding(.horizontal,4)
                
                Image("see_more", bundle: Bundle.main)

            }
        }).padding(.all,12)
            .background(Color.white)
            .foregroundColor(Color(Colors.grey))
            .cornerRadius(23)
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 10, x: 0, y: 5)
        
    }
}

struct SeeMoreButton_Previews: PreviewProvider {
    static var previews: some View {
        SeeMoreButton(title:"SEE MORE"){
            
        }
    }
}

