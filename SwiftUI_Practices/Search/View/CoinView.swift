//
//  CoinView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    @State private var markets: [Market] = []
    @State private var searchTxt: String = ""
    @State private var filteredMarkets: [Market] = []
    
    var body: some View {
        NavigationWrapper {
            ScrollView {
                makeBannerView()
                makeListView()
            }
            .searchable(text: $searchTxt)
            .onSubmit(of: .search) {
                print("네?")
                filterMarkets()
            }
//            .onChange(of: searchTxt) { _, _ in
//                filterMarkets()
//            }
            .refreshable {
                UpbitAPI.fetchAllMarket { data in
                    markets = data.shuffled()
                    filterMarkets()
                }
            }
            .navigationTitle("MyMoney")
        }
        .onAppear {
            UpbitAPI.fetchAllMarket { data in
                markets = data
                filterMarkets()
            }
        }
    }
    
    func filterMarkets() {
        filteredMarkets = markets.filter { market in
            market.koreanName.contains(searchTxt) || market.englishName.contains(searchTxt)
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
    
    func makeListView() -> some View {
        LazyVStack {
            ForEach(filteredMarkets.isEmpty ? $markets : $filteredMarkets) { $item in
                NavigationLink {
                    NavigationLazyView(CoinRowView(coin: $item))
                } label: {
                    CoinRowView(coin: $item)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct CoinRowView: View {
    @Binding var coin: Market
    
    var body: some View {
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
            Button {
                coin.isFav.toggle()
            } label: {
                Image(systemName: coin.isFav ? "star.fill" : "star")
            }
        }
        .padding()
    }
}

#Preview {
    CoinView()
}
