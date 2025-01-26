//
//  ContentView.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var cryptoService = CryptoService()
    @State var searchText = ""
    
    var filteredCryptos: [Crypto] {
            if searchText.isEmpty {
                return cryptoService.cryptos
            } else {
                return cryptoService.cryptos.filter {
                    $0.name.lowercased().contains(searchText.lowercased()) ||
                    $0.symbol.lowercased().contains(searchText.lowercased())
                }
            }
        }
    
    var body: some View {
        NavigationView {
            List(filteredCryptos) { crypto in
                CryptoRow(crypto: crypto)
                NavigationLink(destination: CryptoDetailView(crypto: crypto)) {
                    CryptoRow(crypto: crypto)
                }

            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .listStyle(.plain)
            .navigationTitle("CryptoCurrencies")
            .onAppear {
                cryptoService.fetchCryptos()
            }
        }
    }
}

#Preview {
    ContentView()
}

