//
//  Pokemon.swift
//  Pokemon
//
//  Created by Uldis on 24/04/2018.
//  Copyright © 2018 Uldis. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    var imageUrl: String?
    let hp: String?
    let number: String
    let series: String
    let pokemonSet: String
    
    enum CodingKeys: String, CodingKey {
        case pokemonSet = "set"
        case name
        case imageUrl
        case hp
        case number
        case series
    }
}
