//
//  GamesListInteractorTests.swift
//  BoardGameListTests
//
//  Created by Phetsana PHOMMARINH on 27/09/2020.
//

import XCTest
@testable import BoardGameList_CleanArchi
import Combine

enum GamesListInteractorTestsError: Error {
    case test
}

class GamesListInteractorTests: XCTestCase {

    var sut: GamesListInteractorImpl?

    override func setUp() {
        let games = GamesRepositoryMock.gamesMock()
        let gamesRepositoryMock = GamesRepositoryMock(games: games)
        let appState = GamesListAppState()
        sut = GamesListInteractorImpl(gamesRepository: gamesRepositoryMock, appState: appState)
    }
    
    func test_loadGames() {
        var gamesState = sut?.appState.gamesState
        XCTAssertEqual(gamesState, .loading)

        sut?.loadGames()
        
        gamesState = sut?.appState.gamesState
        
        if case let .loaded(games) = gamesState {
            XCTAssertEqual(games.count, 2)
        } else {
            XCTFail("Unexpected state")
        }
    }
    
    func test_error() {
        let games = GamesRepositoryMock.gamesMock()
        let gamesRepositoryMock = GamesRepositoryMock(games: games, error: GamesListInteractorTestsError.test)
        let appState = GamesListAppState()
        sut = GamesListInteractorImpl(gamesRepository: gamesRepositoryMock, appState: appState)
        
        var gamesState = sut?.appState.gamesState
        XCTAssertEqual(gamesState, .loading)

        sut?.loadGames()
        
        gamesState = sut?.appState.gamesState
        
        if case let .error(error) = gamesState {
            XCTAssertTrue(error.isEqual(to: GamesListInteractorTestsError.test))
        } else {
            XCTFail("Unexpected state")
        }
    }
    
    func test_deinit() {
        let games = GamesRepositoryMock.gamesMock()
        let gamesRepositoryMock = GamesRepositoryMock(games: games)
        let appState = GamesListAppState()
        var sut: GamesListInteractorMock? = GamesListInteractorMock(gamesRepository: gamesRepositoryMock,
                                                                    appState: appState)
        XCTAssertNotNil(sut)
        sut?.loadGames()
        XCTAssertEqual(GamesListInteractorMock.deinitCalled, false)
        sut = nil
        XCTAssertNil(sut)
        XCTAssertEqual(GamesListInteractorMock.deinitCalled, true)
    }
}

final class GamesListInteractorMock: GamesListInteractorImpl {
    static var deinitCalled = false
    
    deinit {
        GamesListInteractorMock.deinitCalled = true
    }
}
