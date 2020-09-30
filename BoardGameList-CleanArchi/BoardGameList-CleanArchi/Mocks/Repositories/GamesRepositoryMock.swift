//
//  GamesRepositoryMock.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

struct GamesRepositoryMock: GamesRepository {

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
    
    let games: [GameItem]
    init(games: [GameItem]) {
        self.games = games
    }
    
    func loadGames() -> AnyPublisher<[GameItem], Error> {
        return Just(games)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
