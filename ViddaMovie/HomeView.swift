//
//  HomeView.swift
//  ViddaMovie
//
//  Created by Vidda on 11/11/2025.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack(spacing: 0) {
                    // Hero Image Section
                    AsyncImage(url: URL(string: Constants.testTitleURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .overlay {
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(
                                            color: .clear,
                                            location: 0.8
                                        ),
                                        Gradient.Stop(
                                            color: .black,
                                            location: 1
                                        ),
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(
                        width: geo.size.width,
                        height: geo.size.height * 0.85
                    )

                    // Action Buttons
                    HStack(spacing: 20) {
                        Button {
                            // Add play action
                        } label: {
                            Text(Constants.playString)
                                .ghostButton()
                        }
                        Button {
                            // Add download action
                        } label: {
                            Text(Constants.downloadString)
                                .ghostButton()
                        }
                    }
                    .padding(.vertical, 20)
                    
                    // Movie Lists
                    HorizontalListView(header: Constants.trendingMovieString)
                    HorizontalListView(header: Constants.trendingTVString)
                    HorizontalListView(header: Constants.topRatedMovieString)
                    HorizontalListView(header: Constants.topRatedTVString)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    HomeView()
}
