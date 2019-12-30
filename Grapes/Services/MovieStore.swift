//
//  MovieStore.swift
//  Grapes
//
//  Created by Victor Rivera on 12/27/19.
//  Copyright © 2019 Victor Rivera. All rights reserved.
//

import Foundation

class MovieStore {
    static let instance = MovieStore()
    private var movies: [Movie] = [Movie]()
    
    
    func decodeMovies(){
        let moviesDecoder = JSONDecoder()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        moviesDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        do {
            let decodedMovies = try moviesDecoder.decode([Movie].self, from: moviesJSON)
            movies = decodedMovies
        } catch {
            print("Failed to decode movies: \(error)")
        }
    }
    
    func getMovies() -> [Movie] {
        return movies
    }
}
