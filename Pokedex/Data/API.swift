//
//  API.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/06.
//

import Foundation
import Moya

enum API {
    case fetchPokemon(limit : Int, offset : Int)
}

extension API : TargetType {
    
    var baseURL: URL {
        get{
            guard let url = URL(string: "https://pokeapi.co/api/v2") else {
                fatalError("invalid URL") }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .fetchPokemon:
            return "/pokemon"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPokemon:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .fetchPokemon(limit, offset):
            let param: [String: Int] = [
                "limit": limit,
                "offset": offset
            ]
            return .requestParameters(
                parameters: param,
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    

}
