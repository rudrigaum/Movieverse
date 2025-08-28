//
//  MovieverseApp.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 26/08/25.
//

import SwiftUI

@main
struct MovieverseApp: App {
    
    private let movieListViewModel = MovieListViewModel()
    
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: movieListViewModel)
        }
    }
}
