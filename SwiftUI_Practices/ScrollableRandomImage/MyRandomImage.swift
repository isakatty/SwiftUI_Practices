//
//  MyRandomImage.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/5/24.
//

import SwiftUI

struct MyRandomImage: View {
    @State private var sections: [SectionImg] = []
    
    var body: some View {
        NavigationWrapper {
            ScrollView(.vertical) {
                ForEach($sections) { $count in
                    HorizontalImgs(section: $count)
                }
            }
            .task {
                await fetchImgs()
            }
            .navigationTitle("My Random Image")
        }
    }
    private func fetchImgs() async {
        guard sections.isEmpty else { return }
        
        for count in 1..<5 {
            let imgs = try? await LoremPicsum.fetchImgs(page: count)
            let section = SectionImg(sectionCount: count, images: imgs ?? [])
            
            DispatchQueue.main.async {
                sections.append(section)
                sections.sort(by: { $0.sectionCount < $1.sectionCount })
            }
        }
    }
}

struct HorizontalImgs: View {
    @Binding var section: SectionImg
    
    var body: some View {
        HStack {
            Text(section.sectionTitle)
                .padding(.leading)
                .padding(.top)
            Spacer()
        }
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(section.images, id: \.id) { item in
                    NavigationLink {
                        NavigationLazyView(NextImgView())
                    } label: {
                        let url = URL(string: item.download_url)
                        ImageView(url: url)
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.leading, 10)
    }
}

struct NextImgView: View {
    
    
    var body: some View {
        Text("넘어올 뷰 // 값 바인딩 걸려야함.")
    }
}

#Preview {
    MyRandomImage()
}
