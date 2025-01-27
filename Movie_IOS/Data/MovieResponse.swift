//
//  MovieResponse.swift
//  Movie_IOS
//
//  Created by Tardes on 27/1/25.
//

import Foundation

struct MovieResponse : Codable {
    let Search:[Movie]
}

struct Movie: Codable {
    // movie name es igual q movie response
    // estructura de la api, por cada llave
    
    let imdbID:String
    let Title:String
    let Year:String
    let Poster: String
    let Country: String?
    let Genre: String?
    let Runtime: String?
    let Director: String?
    let Plot: String?
    
}
    


        
