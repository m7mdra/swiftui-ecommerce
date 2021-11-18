//
//  IndicatorView.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct IndicatorView : View{
    var text:String
    var body: some View{
        Text(text)
          .bold()
          .padding(.horizontal,7)
          .padding(.vertical,7)
          .background(Colors.accent.swiftUiColor)
          .foregroundColor(.white)
          .cornerRadius(23)
          .shadow(color:  Colors.accent.swiftUiColor.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView(text: "51+")
    }
}
