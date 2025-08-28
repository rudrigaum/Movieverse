//
//  MovieListView.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 27/08/25.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    init(viewModel: any MovieListViewModelProtocol) {
        guard let viewModel = viewModel as? MovieListViewModel else {
            fatalError("Injected ViewModel must be a concrete type of MovieListViewModel.")
        }
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text("Hello, world!")
    }
}

//MARK: - Mocks for Preview

private class MockMovieService: MovieServiceProtocol {
    func fetchPopularMovies() async throws -> [Movie] {
        return [
            Movie(id: 1, title: "Mock Movie 1", overview: "Test Overview 1", posterPath: nil, voteAverage: 7.5),
            Movie(id: 2, title: "Mock Movie 2", overview: "Test Overview 2", posterPath: nil, voteAverage: 8.5)
        ]
    }
}

private class MockMovieListViewModel: MovieListViewModelProtocol {
    
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func fetchMovies() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        movies = [
            Movie(id: 1, title: "Mock Movie 1", overview: "Test overview 1", posterPath: nil, voteAverage: 7.5),
            Movie(id: 2, title: "Mock Movie 2", overview: "Test overview 2", posterPath: nil, voteAverage: 8.0)
        ]
    }
}

#Preview {
    MovieListView(viewModel: MockMovieListViewModel())
}
