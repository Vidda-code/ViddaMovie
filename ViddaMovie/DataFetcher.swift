//
//  DataFetcher.swift
//  ViddaMovie
//
//  Created by Vidda on 14/11/2025.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey

// https://api.themoviedb.org/3/trending/movie/day?api_key=de6ed396dd5b853e0404384cd8b0baa0
func fetchTitles(
    for media: String
) async throws -> [String] {
    guard let baseURL = tmdbBaseURL else {
        throw NetworkError.missingConfig
    }
    guard let apiKey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }
    
    guard let fetchTitleURL = URL (string: baseURL)?
        .appending(path: "3/trending/\(media)/day")
        .appending(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
    }
    
    print(fetchTitleURL)
    
    let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
    
    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkError.badURLResponse(underlyingError: NSError(domain: "DataFetcher", code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                                                                   userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Respoonse" ]))
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(APIObject.self, from: data).results as! [String]
}
