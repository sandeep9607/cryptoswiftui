//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 02/04/24.
//

import SwiftUI
import Foundation

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
