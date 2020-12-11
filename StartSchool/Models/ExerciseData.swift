//
//  ExerciseData.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 06/12/2020.
//

import Foundation

struct ExerciseData: Decodable {
    let items: [Items]
}

struct Items: Decodable {
    let fields: Fields
}

struct Fields: Decodable {
    let title: String
    let description: String
    let answer: String
    let level: String
    let done: Bool
    
    let image: Image
}

struct Image: Decodable {
    let sys: Sys
}

struct Sys: Decodable {
    let id: String
}
