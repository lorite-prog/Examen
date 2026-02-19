//
//  File.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import Foundation
    
    
    

class MovieApi {
    static let OMDB_BASE_URL = "https://www.omdbapi.com"
    
    static func getMovieByTitle(imdbID: String) async -> Movie? {
          let apiKey = "35a0b130"
          guard let url = URL(string: "\(OMDB_BASE_URL)/?apikey=\(apiKey)&i=\(imdbID)") else { return nil }

          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          
          do {
              let (data, _) = try await URLSession.shared.data(for: request)

    
              
              let result = try JSONDecoder().decode(Movie.self, from: data)
              return result
                  
          } catch {
              print("Error al obtener o decodificar: \(error)")
              return nil
          }
      }
      
      static func getMovies(title: String) async -> [Movie] {
          let apiKey = "35a0b130"
          guard let url = URL(string: "\(OMDB_BASE_URL)/?apikey=\(apiKey)&s=\(title)") else { return [] }

          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          
          do {
              let (data, _) = try await URLSession.shared.data(for: request)
              
              if let str = String(data: data, encoding: .utf8) {
                  print(str)
              }

            
              let result = try JSONDecoder().decode(OmbdResponse.self, from: data)
              
              return result.search
                  
          } catch {
              print("Error al obtener o decodificar: \(error)")
              return []
          }
      }
      
  }
