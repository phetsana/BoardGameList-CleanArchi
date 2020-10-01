//
//  GamesRepositoryMock.swift
//  BoardGameList-CleanArchiTests
//
//  Created by Phetsana PHOMMARINH on 01/10/2020.
//

@testable import BoardGameList_CleanArchi
import Foundation
import Combine

enum GamesRepositoryMockError: Error {
    case `default`
}

final class GamesRepositoryMock: GamesRepository {
    
    private let games: [GameItem]
    private let error: Error?
    
    init(games: [GameItem], error: Error? = nil) {
        self.games = games
        self.error = error
    }

    func loadGames() -> AnyPublisher<[GameItem], Error> {
        if let error = error {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        return Just(games)            
            .mapError { _ in self.error ?? GamesRepositoryMockError.default }
            .eraseToAnyPublisher()
    }
}

extension GamesRepositoryMock {
    static func game1() -> GameItem {
        let gameDTO =
            GameDTO(id: "game id",
                    name: "Detective Club",
                    imageUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw71ksfWx6nRCU32a5VAdBuMmURsOCD6U9xQ&usqp=CAU"),
                    thumbUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw71ksfWx6nRCU32a5VAdBuMmURsOCD6U9xQ&usqp=CAU"),
                    yearPublished: 2007,
                    minPlayers: 3, maxPlayers: 6,
                    description: "Description ablabla",
                    primaryPublisher: "Publisher",
                    rank: 2, trendingRank: 4)
        
        return GameItem(game: gameDTO)
    }
    
    static func game2() -> GameItem {
        let gameDTO =
            GameDTO(id: "game id 1",
                    name: "The game",
                    imageUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFGmhr7szv9Ifeg3xBiZEznvNSx7fDZww0UNHav222WcWGpyuVIguKihOQGRJtczSY5rrHCSPDGA&usqp=CAc"),
                    thumbUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFGmhr7szv9Ifeg3xBiZEznvNSx7fDZww0UNHav222WcWGpyuVIguKihOQGRJtczSY5rrHCSPDGA&usqp=CAc"),
                    yearPublished: 2007,
                    minPlayers: 3, maxPlayers: 6,
                    description: "Description ablabla",
                    primaryPublisher: "Publisher",
                    rank: 1, trendingRank: 3)
        
        return GameItem(game: gameDTO)
    }
    
    static func gamesMock() -> [GameItem] {
        return [Self.game1(), Self.game2()]
    }
}
