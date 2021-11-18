//
//  Colors.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI
class Colors{
    static let accent = UIColor(red: 1.00, green: 0.41, blue: 0.41, alpha: 1.00)
    static let grey =  UIColor(red: 0.45, green: 0.49, blue: 0.56, alpha: 1.00)
    static let windowBackground = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1.00)
    static let raven = UIColor(red: 0.45, green: 0.49, blue: 0.56, alpha: 1.00)
    static let comet = UIColor(red: 0.32, green: 0.36, blue: 0.44, alpha: 1.00)
}

extension UIColor{
    var swiftUiColor:Color {
        Color(self)
    }
}
