//
//  File.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import Foundation

enum ConfigApi {
    static var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secret", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: filePath),
              let value = dict.object(forKey: "ApiKey") as? String else {
            fatalError("No se ha encontrado la ApiKey")
        }
              return value
    }
}
