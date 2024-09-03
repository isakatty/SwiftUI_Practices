//
//  CoinView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    
    @State private var markets: Markets = []
    @State private var searchTxt: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                makeBannerView()
                makeListView()
            }
            .searchable(text: $searchTxt)
            .refreshable {
                UpbitAPI.fetchAllMarket { data in
                    markets = data.shuffled()
                }
            }
            .navigationTitle("MyMoney")
        }
        .onAppear {
            UpbitAPI.fetchAllMarket { data in
                markets = data
            }
        }
    }
    
    func makeBannerView() -> some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.green)
                    .overlay(alignment: .leading, content: {
                        Circle()
                            .fill(Color.white.opacity(0.4))
                            .scaleEffect(2)
                            .offset(x: -40)
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(height: 150)
                    .padding()
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text("랜덤 코인")
                        .font(.callout)
                    Text("리플")
                        .font(.title)
                        .bold()
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(40)
            }
    }
    func makeRowView(_ coin: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(coin.koreanName)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(coin.englishName)
                    .font(.callout)
            }
            Spacer()
            Text(coin.market)
        }
        .padding()
    }
    func makeListView() -> some View {
        
        let filteredMarkets = markets.filter { market in
            market.koreanName.contains(searchTxt) || market.englishName.contains(searchTxt)
        }
        return LazyVStack{
            ForEach(filteredMarkets.isEmpty ? markets : filteredMarkets) { item in
                
                NavigationLink {
                    CoinNextView(coin: item)
                } label: {
                    makeRowView(item)
                }
            }
        }
    }
}

#Preview {
    CoinView()
}
