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
        VStack(alignment: .leading, spacing: 16) {
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
                .frame(width: 90, height: 90)
                Spacer()
                VStack {
                    
                    
                    Text(crypto.name)
                        .font(.largeTitle)
                        .font(.headline)
                    Text(crypto.symbol.uppercased())
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text("$\(crypto.currentPrice, specifier: "%.2f")")
                        .font(.headline)
                    Text("\(crypto.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
                        .font(.subheadline)
                        .foregroundStyle(crypto.priceChangePercentage24H ?? 0 >= 0 ? .green : .red)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle(crypto.name)
    }
}

#Preview {
    CryptoDetailView(crypto: Crypto(id: "", name: "", symbol: "", currentPrice: 0.0, marketCap: 0.0, priceChangePercentage24H: 0.0, image: ""))
}

