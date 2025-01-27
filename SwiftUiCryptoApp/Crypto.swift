//
//  Crypto.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//
//
import Foundation

struct Crypto: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    let fullyDilutedValuation: Double?
    let totalVolume: Double
    let high24H: Double
    let low24H: Double
    let priceChange24H: Double
    let priceChangePercentage24H: Double
    let marketCapChange24H: Double
    let marketCapChangePercentage24H: Double
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double?
    let ath: Double
    let athChangePercentage: Double
    let athDate: String
    let atl: Double
    let atlChangePercentage: Double
    let atlDate: String
    let roi: Roi?
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case roi
        case lastUpdated = "last_updated"
    }
}

struct Roi: Codable {
    let times: Double
    let currency: String
    let percentage: Double
}

//as struct
//import Foundation
//
//struct Crypto: Identifiable, Codable {
//    let id: String
//    let name: String
//    let symbol: String // Ensure this is correctly mapped
//    var currentPrice: Double
//    let marketCap: Double?
//    let priceChangePercentage24H: Double?
//    let image: String // Add this field
//    
////    codingkeys enum is the best strategy
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name, symbol, image
//        case currentPrice = "current_price"
//        case marketCap = "market_cap"
//        case priceChangePercentage24H = "price_change_percentage_24h"
//    }
//   
//   
//}

// when i change to class
//import Foundation
//
//class Crypto: Identifiable, Codable {
//    var id: String
//    var name: String
//    var symbol: String
//    var currentPrice: Double
//    var marketCap: Double?
//    var priceChangePercentage24H: Double?
//    var image: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, symbol, image
//        case currentPrice = "current_price"
//        case marketCap = "market_cap"
//        case priceChangePercentage24H = "price_change_percentage_24h"
//    }
//
//    init(id: String, name: String, symbol: String, currentPrice: Double, marketCap: Double?, priceChangePercentage24H: Double?, image: String) {
//        self.id = id
//        self.name = name
//        self.symbol = symbol
//        self.currentPrice = currentPrice
//        self.marketCap = marketCap
//        self.priceChangePercentage24H = priceChangePercentage24H
//        self.image = image
//    }
//}
