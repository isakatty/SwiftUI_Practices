//
//  NavigationLazyView.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/5/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    var build: () -> Content
    
    var body: some View {
        build()
    }
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
}

//#Preview {
//    NavigationLazyView()
//}
