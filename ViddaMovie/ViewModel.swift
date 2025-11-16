//
//  ViewModel.swift
//  ViddaMovie
//
//  Created by Vidda on 14/11/2025.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []

    func getTitles() async {
        homeStatus = .fetching

        if trendingMovies.isEmpty {
            do {
                async let tMovies = dataFetcher.fetchTitles(
                    for: "movie",
                    by: "trending"
                )
                async let tTv = dataFetcher.fetchTitles(
                    for: "tv",
                    by: "trending"
                )
                async let tRMovies = dataFetcher.fetchTitles(
                    for: "movie",
                    by: "top_rated"
                )
                async let tRTV = dataFetcher.fetchTitles(
                    for: "tv",
                    by: "top_rated"
                )

                trendingMovies = try await tMovies
                trendingTV = try await tTv
                topRatedMovies = try await tRMovies
                topRatedTV = try await tRTV

                homeStatus = .success
            } catch {
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        } else {
            homeStatus = .success
        }
    }
}
