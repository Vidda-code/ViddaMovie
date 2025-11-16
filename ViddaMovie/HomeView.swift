//
//  HomeView.swift
//  ViddaMovie
//
//  Created by Vidda on 11/11/2025.
//

import SwiftUI

struct HomeView: View {

    let viewModel = ViewModel()
    @State private var titleDetailPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $titleDetailPath) {
            GeometryReader { geo in
                ScrollView {
                    switch viewModel.homeStatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                            .frame(
                                width: geo.size.width,
                                height: geo.size.height
                            )
                    case .success:
                        LazyVStack(spacing: 0) {
                            // Hero Image Section
                            AsyncImage(
                                url: URL(
                                    string: viewModel.heroTitle.posterPath ?? ""
                                )
                            ) {
                                image in
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
                                    titleDetailPath.append(viewModel.heroTitle)
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
                            HorizontalListView(
                                header: Constants.trendingMovieString,
                                titles: viewModel.trendingMovies
                            )
                            HorizontalListView(
                                header: Constants.trendingTVString,
                                titles: viewModel.trendingTV
                            )
                            HorizontalListView(
                                header: Constants.topRatedMovieString,
                                titles: viewModel.topRatedMovies
                            )
                            HorizontalListView(
                                header: Constants.topRatedTVString,
                                titles: viewModel.topRatedTV
                            )
                        }
                        .navigationDestination(for: Title.self) { title in
                             TitleDetailView(title: title)
                        }
                    case .failed(let error):
                        Text("Error: " + String(describing: error))
                    }

                }

                .ignoresSafeArea(edges: .top)
            }
            .task {
                await viewModel.getTitles()
            }
        }
    }
}

#Preview {
    HomeView()
}
