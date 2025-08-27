//
//  MovieServiceProtocol.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 27/08/25.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchPopularMovies() async throws -> [Movie]
}
