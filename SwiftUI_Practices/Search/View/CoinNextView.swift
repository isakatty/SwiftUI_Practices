//
//  CoinNextView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/3/24.
//

import SwiftUI

struct CoinNextView: View {
    var coin: Market
    
    var body: some View {
        Text(coin.koreanName)
            .font(.largeTitle)
    }
}

#Preview {
    CoinNextView(coin: Market(market: "BTC", koreanName: "비트코인", englishName: "BitCoin"))
}
