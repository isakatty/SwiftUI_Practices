//
//  RoundedMBTIView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct RoundedMBTIView: View {
    var MBTITxt: String
    var isSelected: Bool
    
    var body: some View {
        Circle()
            .fill(isSelected ? .blue : .white)
            .stroke(isSelected ? .blue : .gray, lineWidth: 2)
            .frame(width: 40, height: 40, alignment: .center)
            .overlay {
                Text(MBTITxt)
                    .foregroundColor(isSelected ? .white : .gray)
                    .font(.title3)
            }
    }
}

#Preview {
    RoundedMBTIView(MBTITxt: "E", isSelected: true)
}
