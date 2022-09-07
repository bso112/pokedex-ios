//
//  Poketmon.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/06.
//

import Foundation

struct PokemonEntity : Codable {
    let results : [Pokemon]
}

struct Pokemon : Codable {
    let name : String
    let url : String    
}
