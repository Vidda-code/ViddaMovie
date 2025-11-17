//
//  DownloadView.swift
//  ViddaMovie
//
//  Created by Vidda on 17/11/2025.
//

import SwiftData
import SwiftUI

struct DownloadView: View {
    @Query var saveTitles: [Title]

    var body: some View {
        NavigationStack {
            if saveTitles.isEmpty {
                Text("No Downloads")
                    .padding()
                    .font(.title3)
                    .bold()
            } else {
                VerticalListView(titles: saveTitles)
            }
        }
    }
}

#Preview {
    DownloadView()
}
