//
//  ModelData.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load(filename: "landmarkData.json")
}


func load<T: Decodable>(filename: String) -> T{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("could not find file \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
