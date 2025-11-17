//
//  SearchView.swift
//  ViddaMovie
//
//  Created by Vidda on 17/11/2025.
//

import SwiftUI

struct SearchView: View {
    var titles = Title.previewTitle
    @State private var searchByMovies = true
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(titles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")) {
                            image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
            }
            .navigationTitle(
                searchByMovies
                    ? Constants.movieSearchString
                    : Constants.tvSearchString
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        searchByMovies.toggle()
                    } label: {
                        Image(
                            systemName:
                                searchByMovies
                                ? Constants.movieIconString
                                : Constants.tvIconString
                        )
                    }
                }
            }
            .searchable(text: $searchText, prompt: searchByMovies ? Constants.moviePlaceHolderString : Constants.tvPlaceHolderString)
        }
    }
}

#Preview {
    SearchView()
}
