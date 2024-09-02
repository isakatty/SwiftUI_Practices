//
//  SearchModel.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import Foundation

struct CoinInfo: Hashable, Identifiable {
    let id: UUID = UUID()
    
    let leftImgName: String
    let coinName: String
    let coinUnit: String
}
