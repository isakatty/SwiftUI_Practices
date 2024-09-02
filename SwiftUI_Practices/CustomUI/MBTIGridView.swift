//
//  MBTIGridView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct MBTIGridView: View {
    @Binding var selectedMBTI: [String: String]
    @Binding var allSelected: Bool

    let mbtiPairs: [(String, String)] = [
        (Energy.extrovert.toTitle, Energy.introvert.toTitle),
        (Recognition.sensing.toTitle, Recognition.intuition.toTitle),
        (Judgement.thinking.toTitle, Judgement.feeling.toTitle),
        (Life.judging.toTitle, Life.perceiving.toTitle)
    ]

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 4), spacing: 10) {
            ForEach(mbtiPairs, id: \.0) { pair in
                VStack {
                    RoundedMBTIView(MBTITxt: pair.0, isSelected: selectedMBTI[pair.0] == pair.0)
                        .padding(.bottom)
                        .onTapGesture {
                            handleTap(selected: pair.0, other: pair.1)
                        }
                    RoundedMBTIView(MBTITxt: pair.1, isSelected: selectedMBTI[pair.1] == pair.1)
                        .onTapGesture {
                            handleTap(selected: pair.1, other: pair.0)
                        }
                }
            }
        }
        .padding()
    }
    private func handleTap(selected: String, other: String) {
        if selectedMBTI[selected] == selected {
            selectedMBTI[selected] = nil
        } else {
            selectedMBTI[selected] = selected
            selectedMBTI[other] = nil
        }
        
        let selectedKeys = Set(selectedMBTI.keys)
        
        print("Selected Keys: \(selectedKeys)")
        
        allSelected = selectedKeys.count == 4
    }
}
