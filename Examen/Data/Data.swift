//
//  Data.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import Foundation

struct Movie: Codable {
    let id: String
    let title: String
    let year: String
    let poster: String
    let runtime: String?
    let genre: String?
    let director: String?
    let plot: String?
    let country: String?
   
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case country = "Country"
        case id = "imdbID"
    }
}


struct OmbdResponse: Codable{
    let search: [Movie]
    let totalResults: String?
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}
