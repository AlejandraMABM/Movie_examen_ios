//
//  MovieProvider.swift
//  Movie_IOS
//
//  Created by Tardes on 27/1/25.
//

import Foundation

class MovieProvider {
    
   // https://www.omdbapi.com/?apikey=fb7aca4&t=matrix
        
    
    // key "https://www.omdbapi.com/fb7aca4/"

        static func findMovieBy(title: String) async throws -> [Movie] {
            // http://www.omdbapi.com/?t=matrix
            
            // https://www.omdbapi.com/fb7aca4/search/\(title)
            
            //https://www.omdbapi.com/?apikey=fb7aca4&s=matrix
             
                let url = URL(string: "https://www.omdbapi.com/?apikey=fb7aca4&s=\(title)")!
                
                let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            print (result)
            return result.Search
                }
    
    static func findMovieBy(imdbID: String) async throws -> Movie {
        // http://www.omdbapi.com/?t=matrix
        
        // https://www.omdbapi.com/fb7aca4/search/\(title)
         
            let url = URL(string: "http://www.omdbapi.com/\(imdbID)")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(Movie.self, from: data)
        
        print (result)
        return result
            }
    
        }

/* @GET(".")
   suspend fun findAllMovies(
       @Query("s") query: String,
       @Query("apikey") apikey: String = "fb7aca4"
   ): MovieNameList


   //http://www.omdbapi.com/?t=cars


   @GET(".")
   suspend fun findMovieById(
       @Query("i") imdbID: String,
       @Query("apikey") apikey: String = "fb7aca4"
   ): MovieName
 
 */

        
        

