//
//  SearchView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    
    let coinList: [CoinInfo] = [
        CoinInfo(leftImgName: "", coinName: "BitCoin", coinUnit: "BTC"),
        CoinInfo(leftImgName: "", coinName: "Ethereum", coinUnit: "ETH"),
        CoinInfo(leftImgName: "", coinName: "Ripple", coinUnit: "XRP"),
        CoinInfo(leftImgName: "", coinName: "Litecoin Ca..", coinUnit: "LTC"),
        CoinInfo(leftImgName: "", coinName: "어쩌구코인1", coinUnit: "어쩌구코인1"),
        CoinInfo(leftImgName: "", coinName: "어쩌구코인2", coinUnit: "어쩌구코인2"),
        CoinInfo(leftImgName: "", coinName: "어쩌구코인3", coinUnit: "어쩌구코인3"),
        CoinInfo(leftImgName: "", coinName: "어쩌구코인4", coinUnit: "어쩌구코인4")
    ]
    
    var filteredCoins: [CoinInfo] {
        coinList.filter { $0.coinName.contains(search) }
    }
    
    var coins: [CoinInfo] {
        search.isEmpty ? coinList : filteredCoins
    }
    
    var body: some View {
        NavigationView {
            List(coins) { coin in
                coinLabel(name: coin.coinName, unit: coin.coinUnit)
            }
            .listStyle(.grouped)
            .searchable(text: $search)
            .navigationTitle("Search")
        }
    }
    
    
    func coinLabel(name: String, unit: String) -> some View {
        HStack {
            Circle()
                .fill(Color.red)
                .overlay {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .background(Color.white)
                        .clipShape(.circle)
                }
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(name)")
                    .font(.title2)
                Text("\(unit)")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    SearchView()
}
