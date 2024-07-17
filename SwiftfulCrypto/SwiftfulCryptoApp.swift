//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 02/04/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {

    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
