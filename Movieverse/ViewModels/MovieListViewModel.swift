//
//  MovieListViewModel.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 26/08/25.
//

import Foundation
import SwiftUI

final class MovieListViewModel: MovieListViewModelProtocol, ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    @MainActor
    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedMovies = try await movieService.fetchPopularMovies()
            movies = fetchedMovies
        } catch {
            errorMessage = "Failed to fetch movies: \(error.localizedDescription)"
            print(error)
        }
        
        isLoading = false 
    }
    
}
