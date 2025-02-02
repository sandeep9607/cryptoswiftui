//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 18/04/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { (returnedImage) in
                self.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
