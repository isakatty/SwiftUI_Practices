//
//  OnboardingView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                Image("launchs")
                Image("launchImages")
                Spacer()
                NavigationLink {
                    ProfileSettingView()
                } label: {
                    RoundedView(labelTxt: "시작하기", bgColor: .blue)
                }

            }
        }
    }
}

#Preview {
    OnboardingView()
}
