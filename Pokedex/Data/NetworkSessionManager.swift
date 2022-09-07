//
//  NetworkSessionManager.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/07.
//

import Foundation
import Alamofire

final class NetworkSessionManager: Alamofire.Session {

    static let shared: NetworkSessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // request timeout (초)
        configuration.timeoutIntervalForResource = 60 // resource timeout (초)
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return NetworkSessionManager(configuration: configuration)
    }()
}
