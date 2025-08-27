//
//  Movie.swift
//  Movieverse
//
//  Created by Rodrigo Cerqueira Reis on 27/08/25.
//

import Foundation


struct MovieResponse: Decodable {
   
    let results: [Movie]
}


struct Movie: Decodable, Identifiable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double
    
    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }

}
