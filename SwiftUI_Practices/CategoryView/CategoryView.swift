//
//  CategoryView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/6/24.
//

import SwiftUI

struct CategoryView: View {
    @State private var category = Categories()
    @State private var searchtxt = ""
    let item = ["스릴러", "로맨스", "애니메이션", "가족", "SF"]
    private var filtered: Categories {
        return category.filter { $0.name.contains(searchtxt)}
    }
    
    var body: some View {
        NavigationWrapper {
            List(filtered.isEmpty ? category : filtered) { item in
                HStack {
                    Image(systemName: "person")
                    Text("\(item.name) (\(item.randomCount))")
                }
            }
            .searchable(text: $searchtxt)
            .navigationBarRightItem {
                Button(action: {
                    category.append(Category(name: item.randomElement()!, randomCount: Int.random(in: 1...100)))
                }, label: {
                    Image(systemName: "gearshape")
                })
            }
            .navigationTitle("영화검색")
        }
    }
}

#Preview {
    CategoryView()
}
