//
//  Markets.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/3/24.
//

import Foundation

typealias Markets = [Market]

struct Market: Hashable, Codable, Identifiable {
    let id = UUID()
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket(completion: @escaping (Markets) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchMarketAsync() async throws -> Markets {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        // 응답이 올때까지 기다리고 있을 것 !!!!!! -> 비동기이지만 동기처럼 action.
        let (data, response) = try await URLSession.shared.data(from: url)
        let decodeData = try JSONDecoder().decode(Markets.self, from: data)
        return decodeData
    }
}
