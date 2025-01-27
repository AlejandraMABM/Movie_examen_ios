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
        // Construye la URL con el imdbID
    let url = URL(string:"https://www.omdbapi.com/?apikey=fb7aca4&i=\(imdbID)")!
        
       
        
        // Realiza la solicitud de datos a la API
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Verifica si la respuesta fue exitosa
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        // Decodifica la respuesta JSON a un objeto Movie
        let result = try JSONDecoder().decode(Movie.self, from: data)
        
        // Verifica si la respuesta tiene los datos de la película
        if result.Title.isEmpty {
            throw NSError(domain: "MovieAPI", code: 404, userInfo: [NSLocalizedDescriptionKey: "Movie not found"])
        }

        print(result) // Imprime los resultados en la consola para depuración

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

        
        

