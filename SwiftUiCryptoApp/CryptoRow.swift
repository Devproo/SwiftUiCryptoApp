//
//  CryptoRow.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//

import SwiftUI

struct CryptoRow: View {
    let crypto: Crypto

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: crypto.image)) {
                phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }.frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(crypto.name)
                    .font(.headline)
                Text(crypto.symbol.uppercased()) // Ensure this line is present
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("$\(crypto.currentPrice, specifier: "%.2f")")
                    .font(.headline)
                Text("\(crypto.priceChangePercentage24H, specifier: "%.2f")%")
                    .font(.subheadline)
                    .foregroundColor(crypto.priceChangePercentage24H >= 0 ? .green : .red)
            }
        }
        .padding(.vertical, 8)
    }
}
#Preview {

    CryptoRow(crypto: Crypto(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 27250.32,
        marketCap: 529841200000,
        marketCapRank: 1,
        fullyDilutedValuation: 572400000000,
        totalVolume: 29000000000,
        high24H: 27500.50,
        low24H: 26800.10,
        priceChange24H: -150.12,
        priceChangePercentage24H: -0.55,
        marketCapChange24H: -2300000000,
        marketCapChangePercentage24H: -0.43,
        circulatingSupply: 19400000,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69000,
        athChangePercentage: -60.5,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 400000.2,
        atlDate: "2013-07-06T00:00:00.000Z",
        roi: Roi(times: 65.2, currency: "usd", percentage: 6520),
        lastUpdated: "2024-01-27T10:25:14.839Z"
    ))
}
