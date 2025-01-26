//
//  CryptoService.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//

import Foundation

@Observable
class CryptoService: ObservableObject {
   var cryptos: [Crypto] = []

    func fetchCryptos() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Crypto].self, from: data)
                    DispatchQueue.main.async {
                        self.cryptos = decodedData
                        print("Fetched Cryptos: \(self.cryptos)") // Debug print
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
    
}
