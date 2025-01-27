//
//  CryptoDetailView.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//
import SwiftUI

struct CryptoDetailView: View {
    let crypto: Crypto

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header Section
                HStack {
                    AsyncImage(url: URL(string: crypto.image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image(systemName: "questionmark.circle") // Fallback icon
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView() // Loading indicator
                        }
                    }
                    .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(crypto.name.isEmpty ? "Unknown" : crypto.name)
                            .font(.largeTitle)
                            .bold()
                        Text(crypto.symbol.uppercased())
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }

                Divider()

                // Price Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Price")
                        .font(.title2)
                        .bold()
                    Text("$\(crypto.currentPrice, specifier: "%.2f")")
                        .font(.title3)
                    HStack {
                        Text("24h Change:")
                        Text("\(crypto.priceChangePercentage24H, specifier: "%.2f")%")
                            .foregroundColor(crypto.priceChangePercentage24H >= 0 ? .green : .red)
                    }
                }

                Divider()

                // Market Data Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Market Data")
                        .font(.title2)
                        .bold()
                    HStack {
                        Text("Market Cap:")
                        Spacer()
                        Text("$\(crypto.marketCap, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Market Cap Rank:")
                        Spacer()
                        Text("#\(crypto.marketCapRank)")
                    }
                    HStack {
                        Text("24h High:")
                        Spacer()
                        Text("$\(crypto.high24H, specifier: "%.2f")")
                    }
                    HStack {
                        Text("24h Low:")
                        Spacer()
                        Text("$\(crypto.low24H, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Circulating Supply:")
                        Spacer()
                        Text("\(crypto.circulatingSupply, specifier: "%.0f") \(crypto.symbol.uppercased())")
                    }
                    HStack {
                        Text("Total Supply:")
                        Spacer()
                        Text("\(crypto.totalSupply, specifier: "%.0f") \(crypto.symbol.uppercased())")
                    }
                    if let maxSupply = crypto.maxSupply {
                        HStack {
                            Text("Max Supply:")
                            Spacer()
                            Text("\(maxSupply, specifier: "%.0f") \(crypto.symbol.uppercased())")
                        }
                    }
                }

                Divider()

                // All-Time High/Low Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("All-Time High/Low")
                        .font(.title2)
                        .bold()
                    HStack {
                        Text("All-Time High:")
                        Spacer()
                        Text("$\(crypto.ath, specifier: "%.2f")")
                    }
                    HStack {
                        Text("ATH Change:")
                        Spacer()
                        Text("\(crypto.athChangePercentage, specifier: "%.2f")%")
                    }
                    HStack {
                        Text("ATH Date:")
                        Spacer()
                        Text(crypto.athDate)
                    }
                    HStack {
                        Text("All-Time Low:")
                        Spacer()
                        Text("$\(crypto.atl, specifier: "%.2f")")
                    }
                    HStack {
                        Text("ATL Change:")
                        Spacer()
                        Text("\(crypto.atlChangePercentage, specifier: "%.2f")%")
                    }
                    HStack {
                        Text("ATL Date:")
                        Spacer()
                        Text(crypto.atlDate)
                    }
                }

                Divider()

                // Additional Info Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Additional Info")
                        .font(.title2)
                        .bold()
                    HStack {
                        Text("Fully Diluted Valuation:")
                        Spacer()
                        Text("$\(crypto.fullyDilutedValuation ?? 0, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Total Volume:")
                        Spacer()
                        Text("$\(crypto.totalVolume, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Last Updated:")
                        Spacer()
                        Text(crypto.lastUpdated)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(crypto.name.isEmpty ? "Crypto Details" : crypto.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CryptoDetailView(crypto: Crypto(
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
    )
       )
   
}
//import SwiftUI
//
//struct CryptoDetailView: View {
//    let crypto: Crypto
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            HStack {
//                AsyncImage(url: URL(string: crypto.image)) { phase in
//                    if let image = phase.image {
//                        image
//                            .resizable()
//                            .scaledToFit()
//                    } else if phase.error != nil {
//                        Image(systemName: "questionmark.circle") // Fallback icon
//                            .resizable()
//                            .scaledToFit()
//                    } else {
//                        ProgressView() // Loading indicator
//                    }
//                }
//                .frame(width: 90, height: 90)
//                Spacer()
//                VStack {
//                    
//                    
//                    Text(crypto.name)
//                        .font(.largeTitle)
//                        .font(.headline)
//                    Text(crypto.symbol.uppercased())
//                        .font(.subheadline)
//                        .foregroundStyle(.gray)
//                    Text("$\(crypto.currentPrice, specifier: "%.2f")")
//                        .font(.headline)
//                    Text("\(crypto.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
//                        .font(.subheadline)
//                        .foregroundStyle(crypto.priceChangePercentage24H ?? 0 >= 0 ? .green : .red)
//                }
//            }
//            Spacer()
//        }
//        .padding()
//        .navigationTitle(crypto.name)
//    }
//}
//
//#Preview {
//    CryptoDetailView(crypto: Crypto(id: "", name: "", symbol: "", currentPrice: 0.0, marketCap: 0.0, priceChangePercentage24H: 0.0, image: ""))
//}
//
