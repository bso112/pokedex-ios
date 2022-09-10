//
//  PoketmonService.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/06.
//

import Foundation
import RxSwift
import Moya



final class PokemonService {
    static let shared = PokemonService()
    
    static let PAGING_SIZE = 20
    private var page = 0
    
    let disposeBag = DisposeBag()
    
    let apiProvider = MoyaProvider<API>(
        session: NetworkSessionManager.shared,
        plugins: [NetworkLogger()]
    )
    
    func fetchPokemon(limit : Int = PokemonService.PAGING_SIZE) -> Single<[Pokemon]> {
        return request(.fetchPokemon(limit: limit, offset: page * PokemonService.PAGING_SIZE), type: PokemonEntity.self).map{ $0.results }
    }
    
}


extension PokemonService {
    private func request<T: Codable>(
        _ target: API,
        type: T.Type
    ) -> Single<T> {
        return Single.create { single -> Disposable in
            self.apiProvider.rx
                .request(target)
                .observe(
                on: ConcurrentDispatchQueueScheduler(qos: .default)
            )
                .retry(3)
                .filterSuccessfulStatusCodes()
                .subscribe(on: MainScheduler.instance)
                .map({ response -> T in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(
                    T.self,
                    from: response.data
                )
            })
                .subscribe(
                onSuccess: { result in
                    self.page += 1
                    return single(.success(result))
                },
                onFailure: { error in
                    if let moyaError = error as? MoyaError {
                        return single(.failure(moyaError))
                    } else {
                        return single(.failure(error))
                    }
                })
        }
    }
}
