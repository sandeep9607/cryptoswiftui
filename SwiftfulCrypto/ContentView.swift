//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 02/04/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 40){
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
