//
//  CircleProfileView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct CircleProfileView: View {
    @State var randomInt: Int = Int.random(in: 0...11)
    
    init() {
        print(randomInt)
    }
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .overlay {
                Image("profile_\(randomInt)")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .background(Color.white)
                    .clipShape(.circle)
            }
    }
}

#Preview {
    CircleProfileView()
}
