//
//  GameDetailInteractorTests.swift
//  BoardGameListTests
//
//  Created by Phetsana PHOMMARINH on 27/09/2020.
//

import XCTest
@testable import BoardGameList_CleanArchi
import Combine

//enum GamesListInteractorTestsError: Error {
//    case test
//}

class GameDetailInteractorTests: XCTestCase {

    var sut: GameDetailInteractorImpl?

    override func setUp() {
        
    }
    
    func test_loadGame() {
        let game = GamesRepositoryMock.game1()
        let expectedGame = GameItemDetail(game: game)
        let appState = GameDetailAppState()
        sut = GameDetailInteractorImpl(game: game, appState: appState)
                
        var appStateGame = sut?.appState.gameState
        if case .loading = appStateGame {
            XCTAssertTrue(true)
        } else {
            XCTFail("Unexpected state")
        }
                        
        sut?.loadGame()
        
        appStateGame = sut?.appState.gameState
        if case let .loaded(game) = appStateGame {
            XCTAssertEqual(game, expectedGame)
        } else {
            XCTFail("Unexpected state")
        }
    }

    func test_deinit() {
        let game = GamesRepositoryMock.game1()
        let appState = GameDetailAppState()
        var sut: GameDetailInteractorMock? = GameDetailInteractorMock(game: game, appState: appState)
        XCTAssertNotNil(sut)
        sut?.loadGame()
        XCTAssertEqual(GameDetailInteractorMock.deinitCalled, false)
        sut = nil
        XCTAssertNil(sut)
        XCTAssertEqual(GameDetailInteractorMock.deinitCalled, true)
    }
}

final class GameDetailInteractorMock: GameDetailInteractorImpl {
    static var deinitCalled = false

    deinit {
        GameDetailInteractorMock.deinitCalled = true
    }
}
