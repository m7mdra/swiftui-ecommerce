//
//  RatingView.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI

struct RatingView : View{
    var rating:String
    var body: some View{
        HStack(alignment:.center){
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(.white)
            
            Text(rating)
                .bold()
                .foregroundColor(.white)
        }.padding(.horizontal,6)
            .padding(.vertical,4)
        .background(Colors.accent.swiftUiColor)
        .cornerRadius(24)
            
    }
}
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: "5.0")
    }
}
