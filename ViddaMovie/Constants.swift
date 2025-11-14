//
//  Constants.swift
//  ViddaMovie
//
//  Created by Vidda on 11/11/2025.
//

import Foundation
import SwiftUI

struct Constants {

    static let homeString: String = "Home"
    static let upcomingString: String = "Upcoming"
    static let searchString: String = "Search"
    static let downloadString: String = "Download"
    static let playString: String = "Play"
    static let trendingMovieString: String = "Trending Movies"
    static let trendingTVString: String = "Trending TV"
    static let topRatedMovieString: String = "Top Rated Movies"
    static let topRatedTVString: String = "Top Rated TV"

    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line.alt"

    static let testTitleURL = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg"
    static let testTitleURL3 = "https://picsum.photos/200/300"
    
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]) {
        for index in titles.indices {
            if let path = titles[index].posterPath {
                titles[index].posterPath = Constants.posterURLStart + path
            }
        }
    }
}

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
