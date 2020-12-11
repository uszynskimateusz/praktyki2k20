//
//  ExerciseData.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 06/12/2020.
//

import Foundation

//main
struct ExerciseData: Decodable {
    let total: Int
    let items: [Items]
    let includes: IncludeImage
}

//main --> "items: []"
struct Items: Decodable {
    let fields: Fields
}

//main --> "items: []" --> fields
struct Fields: Decodable {
    let title: String
    let description: String
    let answer: String
    let level: String
    let done: Bool
    
    let image: ImageImage
}

//main --> "items: []" --> "fields" --> "image"
struct ImageImage: Decodable {
    let sys: Sys
}

//main --> "items: []" --> "fields" --> "image" --> "sys"
struct Sys: Decodable {
    let id: String
}

//main --> "includes"
struct IncludeImage: Decodable {
    let Asset: [AssetsImage]
}

//main --> "includes" --> "Asset: []"
struct AssetsImage: Decodable {
    let sys: SysImage
    let fields: FieldImage
}

//main --> "includes" --> "Asset: []" --> "sys"
struct SysImage: Decodable {
    let id: String
}

//main --> "includes" --> "Asset: []" --> "fields"
struct FieldImage: Decodable {
    let file: FileImage
}

//main --> "includes" --> "Asset: []" --> "fields" --> "file"
struct FileImage: Decodable {
    let url: String
}


