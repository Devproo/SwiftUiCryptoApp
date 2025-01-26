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
                Text("\(crypto.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
                    .font(.subheadline)
                    .foregroundColor(crypto.priceChangePercentage24H ?? 0 >= 0 ? .green : .red)
            }
        }
        .padding(.vertical, 8)
    }
}
#Preview {
    CryptoRow(crypto: Crypto(id: "", name: "", symbol: "", currentPrice: 0.0, marketCap: 0.0, priceChangePercentage24H: 0.0, image: ""))
}
