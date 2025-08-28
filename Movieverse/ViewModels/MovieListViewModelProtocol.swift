//
//  MovieListViewModelProtocol.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 27/08/25.
//

import Foundation

protocol MovieListViewModelProtocol: ObservableObject {
    var movies: [Movie] { get set  }
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }

    func fetchMovies() async
}
