//
//  GamesRepository.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

protocol GamesRepository {
    func loadGames() -> AnyPublisher<[GameItem], Error>
}

struct GamesRepositoryImpl: GamesRepository {
    
    let networkingService: NetworkingService
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    func loadGames() -> AnyPublisher<[GameItem], Error> {
        let request = GetGamesRequest()
        return networkingService
            .send(request)
            .map { $0.games.map(GameItem.init) }
            .receive(on: RunLoop.main)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
