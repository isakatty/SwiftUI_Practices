//
//  RoundedView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct RoundedView: View {
    var labelTxt: String
    var bgColor: Color
    
    var body: some View {
        Text("\(labelTxt)")
            .foregroundStyle(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .clipShape(.capsule)
            .padding(.horizontal)
    }
}

#Preview {
    RoundedView(labelTxt: "시작하기", bgColor: .blue)
}
