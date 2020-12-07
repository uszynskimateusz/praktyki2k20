//
//  ImageData.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 06/12/2020.
//

import Foundation

struct ImageData: Decodable {
    let fields: Field
}

struct Field: Decodable {
    let file: File
}

struct File: Decodable {
    let url: String
}
