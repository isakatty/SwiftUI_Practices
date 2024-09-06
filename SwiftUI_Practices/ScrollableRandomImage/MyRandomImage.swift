//
//  MyRandomImage.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/5/24.
//

import SwiftUI

struct MyRandomImage: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var sections: [SectionImg] = []
    
    @State private var sectionString: [String] = ["첫번째 섹션", "두번째 섹션", "세번째 섹션", "네번째 섹션"]
    
    var body: some View {
        NavigationWrapper {
            ScrollView(.vertical) {
                ForEach($sectionString, id: \.self) { $count in
                    HorizontalImgs(section: $count)
                }
            }
            .task {
                print("== task ==")
                await fetchImgs()
            }
            .navigationTitle("My Random Image")
        }
    }

    private func fetchImgs() async {
        guard sections.isEmpty else {
            print("엠티 아님")
            return
        }
        print("엠티!!")

        for count in 1..<5 {
            let imgs = try? await LoremPicsum.fetchImgs(page: count)
            let section = SectionImg(sectionCount: count, images: imgs ?? [], sectionTitle: "\(count)번째 섹션")

            DispatchQueue.main.async {
                print("\(count), \(section.sectionTitle)")
                sections.append(section)
                sections.sort(by: { $0.sectionCount < $1.sectionCount })
            }
        }
    }
}

struct HorizontalImgs: View {
//    @Binding var section: SectionImg
    @Binding var section: String
    
    let url = URL(string: "https://picsum.photos/200/300")
    var body: some View {
        HStack {
            Text(section)
                .padding(.leading)
                .padding(.top)
            Spacer()
        }
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { item in
                    NavigationLink {
                        NavigationLazyView(
                            NextImgView(section: $section, url: url)
                        )
                    } label: {
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
    @Binding var section: String
    let url: URL?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .center) {
            ImageResizeView(url: url)
            TextField(section, text: $section)
            
            Button(action: {
//                print(section.sectionTitle, "Dismiss 직전")
                dismiss()
            }, label: {
                Text("변경")
            })
        }
    }
}

struct ImageResizeView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(alignment: .center)
        .padding()
    }
}

#Preview {
    MyRandomImage()
}
