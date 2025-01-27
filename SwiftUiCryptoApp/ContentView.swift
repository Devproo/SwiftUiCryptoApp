//
//  ContentView.swift
//  SwiftUiCryptoApp
//
//  Created by ipeerless on 25/01/2025.
//
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
//                 use that if just func in  service
//                cryptoService.fetchCryptos()
//                but use Task with async
                Task {
                    cryptoService.fetchCryptos()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//workswith completion
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var cryptoService = CryptoService() // Use @StateObject for class-based ObservableObject
//    @State private var searchText = ""
//
//    var filteredCryptos: [Crypto] {
//        if searchText.isEmpty {
//            return cryptoService.cryptos
//        } else {
//            return cryptoService.cryptos.filter {
//                $0.name.lowercased().contains(searchText.lowercased()) ||
//                $0.symbol.lowercased().contains(searchText.lowercased())
//            }
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            List(filteredCryptos) { crypto in
//                NavigationLink(destination: CryptoDetailView(crypto: crypto)) {
//                    CryptoRow(crypto: crypto)
//                }
//            }
//            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
//            .listStyle(.plain)
//            .navigationTitle("CryptoCurrencies")
//            .onAppear {
//                cryptoService.fetchCryptos { cryptos in
//                    if let cryptos = cryptos {
//                        DispatchQueue.main.async {
//                            cryptoService.cryptos = cryptos // Update the data
//                        }
//                    } else {
//                        print("Failed to fetch cryptos.")
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
