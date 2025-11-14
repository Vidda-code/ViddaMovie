//
//  Errors.swift
//  ViddaMovie
//
//  Created by Vidda on 13/11/2025.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case let .dataLoadingFailed(underlyingError):
            return "Data loading failed: \(underlyingError.localizedDescription)"
        case let .decodingFailed(underlyingError):
            return "Decoding failed: \(underlyingError.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Failed to parse URL Response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing API configuration."
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
}
