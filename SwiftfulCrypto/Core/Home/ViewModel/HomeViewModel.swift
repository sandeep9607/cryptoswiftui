//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 09/04/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "title 1", value: "Value", percentageChange: 1),
        StatisticModel(title: "title 1", value: "Value"),
        StatisticModel(title: "title 1", value: "Value"),
        StatisticModel(title: "title 1", value: "Value", percentageChange: -7),
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private var coinDataService = CoinDataService()
    private var marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers() {

        // update allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoin)
            .sink { [weak self] (returnedCoin) in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
        
        //update marketData
        marketDataService.$marketData
            .map (mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoin(text: String, coins: [CoinModel])-> [CoinModel]{
        guard !text.isEmpty else{
            return coins
        }
        
        let lowercaseText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name!.lowercased().contains(lowercaseText) ||
            coin.symbol!.lowercased().contains(lowercaseText) ||
            coin.id!.lowercased().contains(lowercaseText)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [marketCap, volume, btcDominance])
        
        return stats
    }
}
