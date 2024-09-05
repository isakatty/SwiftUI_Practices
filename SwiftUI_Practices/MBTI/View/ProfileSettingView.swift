//
//  ProfileSettingView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    @State private var nickname: String = ""
    
    @State private var selectedMBTI: [String: String] = [:]
    @State private var allSelected: Bool = false
    
    var body: some View {
        VStack {
            CircleProfileView()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.init(top: 0, leading: 0, bottom: 30, trailing: 0))
            
            TextField("닉네임을 입력해주세요 :)", text: $nickname)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            Rectangle()
                .fill(Color.gray).opacity(0.4)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 1)
            HStack {
                Text("MBTI")
                    .bold()
                    .padding(.trailing, 20)
                
                MBTIGridView(selectedMBTI: $selectedMBTI, allSelected: $allSelected)
                    .frame(height: 130)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 10)
                    .opacity(0.5)
            }
            .padding(.init(top: 30, leading: 10, bottom: 0, trailing: 10))
            Spacer()
            
            NavigationLink {
                SuccessView()
            } label: {
                RoundedView(
                    labelTxt: "완료",
                    bgColor: allSelected ? Color.blue : Color.gray.opacity(0.5)
                )
            }
            .disabled(!allSelected)

        }
    }
}


#Preview {
    NavigationView {
        ProfileSettingView()
    }
}
