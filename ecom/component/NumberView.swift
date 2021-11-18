//
//  NumberView.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct BaseNumberView : View{
    var text:String
    var textColor:UIColor
    var enableShadow:Bool
    private let shadowColor = UIColor(red: 0.45, green: 0.49, blue: 0.56, alpha: 1.00)
    var body: some View{
          Text(text)
            .font(Font.custom("", size: 19))
            .padding(.horizontal,40)
            .padding(.vertical,20)
            .background(Color.white)
            .foregroundColor(Color(textColor))
            .cornerRadius(23)
            .shadow(color:  Color(enableShadow ? shadowColor.withAlphaComponent(0.06):UIColor.clear), radius: 10, x: 0, y: 5)
    }
}

struct NumberView:View{
    var text:String
    init(_ text:String) {
        self.text = text
    }
    
    var body: some View{
        BaseNumberView(text: text, textColor: Colors.grey, enableShadow: true)
    }
}

struct AccentedNumberView:View{
    var text:String
    init(_ text:String) {
        self.text = text
    }
    var body: some View{
        BaseNumberView(text: text, textColor: Colors.accent, enableShadow: false)
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer()
            AccentedNumberView( "4.5")
            Spacer()
            NumberView( "4.5")
            Spacer()
        }
    
    }
}
