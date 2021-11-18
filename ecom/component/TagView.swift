//
//  TagView.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct TagView:View{
    var text:String
    var body: some View{
        Colors.windowBackground.swiftUiColor.overlay{
        Text(text)
                
            .padding(.horizontal,20)
            .padding(.vertical,8)
            .background(.white)
            .foregroundColor(Colors.comet.swiftUiColor)

            .cornerRadius(5)
        }
            
    }
}
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(text: "This is a tag")
    }
}
