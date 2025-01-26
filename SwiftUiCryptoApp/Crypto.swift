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
    let name: String
    let symbol: String // Ensure this is correctly mapped
    var currentPrice: Double
    let marketCap: Double?
    let priceChangePercentage24H: Double?
    let image: String // Add this field
    
//    codingkeys enum is the best strategy
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
   
   
}
