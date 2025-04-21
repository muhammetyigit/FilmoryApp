//
//  MovieManager.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 21.04.2025.
//

import Foundation

class MovieManager {
    
    static let shared = MovieManager()
    
    var movies: [NewMovie] = []
    
    private init() {}
    
    func addMovie(_ movie: NewMovie) {
        movies.append(movie)
    }
    
    func getAllMovies() -> [NewMovie] {
        return movies
    }
    
    func getMovies(for category: String) -> [NewMovie] {
        return movies.filter { $0.category == category }
    }
}
