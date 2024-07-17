//
//  StatisticModel.swift
//  SwiftfulCrypto
//
//  Created by Sandeep Maurya on 26/04/24.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

let stat1 = StatisticModel( title: "Market Cap", value: "$12.58n",percentageChange: 25.34)
let stat2 = StatisticModel( title: "Total Volume", value: "$1.23Tr")
let stat3 = StatisticModel( title: "Total Volume", value: "$1.23Tr")
