//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 19/04/24.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
