//
//  GameItemDetailTests.swift
//  BoardGameList-CleanArchiTests
//
//  Created by Phetsana PHOMMARINH on 01/10/2020.
//

import XCTest
@testable import BoardGameList_CleanArchi
import Rswift

class GameItemDetailTests: XCTestCase {
    func test_init() {
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
        let gameItem = GameItem(game: gameDTO)
        let sut = GameItemDetail(game: gameItem)
        
        XCTAssertEqual(sut.id, "game id")
        XCTAssertEqual(sut.name, "Detective Club")
        XCTAssertEqual(sut.imageURL, URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw71ksfWx6nRCU32a5VAdBuMmURsOCD6U9xQ&usqp=CAU"))
        XCTAssertEqual(sut.description, "Description ablabla")
        XCTAssertEqual(sut.descriptionTitle, R.string.localizable.game_detail_description() + ":")
        XCTAssertEqual(sut.playersTitle, R.string.localizable.game_detail_players() + ":")
        XCTAssertEqual(sut.playersText, "3 - 6")
    }
    
    func test_description_nil() {
        let gameDTO =
            GameDTO(id: "game id",
                    name: "Detective Club",
                    imageUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw71ksfWx6nRCU32a5VAdBuMmURsOCD6U9xQ&usqp=CAU"),
                    thumbUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw71ksfWx6nRCU32a5VAdBuMmURsOCD6U9xQ&usqp=CAU"),
                    yearPublished: 2007,
                    minPlayers: 3, maxPlayers: 6,
                    description: nil,
                    primaryPublisher: "Publisher",
                    rank: 2, trendingRank: 4)
        let gameItem = GameItem(game: gameDTO)
        let sut = GameItemDetail(game: gameItem)
        
        XCTAssertEqual(sut.description, "")
    }
}
