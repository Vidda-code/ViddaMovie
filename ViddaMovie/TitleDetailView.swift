//
//  TitleDetailView.swift
//  ViddaMovie
//
//  Created by Vidda on 16/11/2025.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .leading) {
                    YoutubePlayer(videoId: "pbiQKOmsIKg")
                        .aspectRatio(1.3, contentMode: .fit)
                    
                    Text((title.name ?? title.title) ?? "")
                        .bold()
                        .font(.title2)
                        .padding(5)
                    
                    Text(title.overview ?? "")
                        .padding(5)

                }
            }
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitle[0])
}
