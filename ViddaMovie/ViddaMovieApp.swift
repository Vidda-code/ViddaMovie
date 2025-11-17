//
//  ViddaMovieApp.swift
//  ViddaMovie
//
//  Created by Vidda on 11/11/2025.
//

import SwiftUI
import SwiftData

@main
struct ViddaMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
