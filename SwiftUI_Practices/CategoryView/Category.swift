//
//  Category.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/6/24.
//

import Foundation

typealias Categories = [Category]

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let randomCount: Int
}
