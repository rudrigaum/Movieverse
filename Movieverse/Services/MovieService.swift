//
//  MovieService.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 27/08/25.
//

import Foundation


final class MovieService: MovieServiceProtocol {
    
    private let apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
                fatalError("API Key not found in Info.plist")
        }
        return key
    }()
    
    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        
        return decodedResponse.results
    }
}
