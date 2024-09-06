//
//  RandomImg.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/5/24.
//

import SwiftUI

struct SectionImg: Identifiable, Comparable {
    static func == (lhs: SectionImg, rhs: SectionImg) -> Bool {
        return lhs.sectionCount == rhs.sectionCount
    }
    
    static func < (lhs: SectionImg, rhs: SectionImg) -> Bool {
        return lhs.sectionCount < rhs.sectionCount
    }
    let id = UUID()
    let sectionCount: Int
    let images: Images
    var sectionTitle: String
}

typealias Images = [RandomImg]

struct RandomImg: Decodable {
    let id: String
    let download_url: String
}

struct LoremPicsum {
    
    private init() { }
    
    static func fetchImgs(page: Int) async throws -> Images {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=10") else {
            print("url Error")
            return []
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(Images.self, from: data)
        return decodedData
    }
    
    static func fetchImages(page: Int, completion: @escaping (Images) -> Void) {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=10") else {
            print("url Error")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Images.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
