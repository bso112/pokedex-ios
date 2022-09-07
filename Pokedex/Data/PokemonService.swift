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
    
    let disposeBag = DisposeBag()
    
    let apiProvider = MoyaProvider<API>(
        session: NetworkSessionManager.shared,
        plugins: [NetworkLogger()]
    )
    
    func fetchPokemon() -> Single<[Pokemon]> {
        return request(.fetchPokemon, type: PokemonEntity.self).map{ $0.results }
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
