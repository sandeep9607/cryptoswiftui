//
//  SearchbarView.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 19/04/24.
//

import SwiftUI

struct SearchbarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ?
                    Color.theme.secondaryText : Color.theme.accent)
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundStyle(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x:0,y:0)
        )
        .padding()
    }
}

#Preview {
    SearchbarView(searchText: .constant(""))
}
