//
//  GamesRepositoryTests.swift
//  BoardGameList-CleanArchiTests
//
//  Created by Phetsana PHOMMARINH on 01/10/2020.
//

import XCTest
@testable import BoardGameList_CleanArchi
import Combine

class GamesRepositoryTests: XCTestCase {

    var sut: GamesRepositoryImpl?

    var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        let networkingServiceMock = NetworkingServiceMock(file: "api_search")
        sut = GamesRepositoryImpl(networkingService: networkingServiceMock)
    }
    
    override func tearDown() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
    
    func test_loadGames() {
        let loadGamesExpectation = self.expectation(description: "Load games")
        sut?
            .loadGames()
            .sink(receiveCompletion: { (_) in
                
            }, receiveValue: { (games) in
                loadGamesExpectation.fulfill()
                XCTAssertEqual(games.count, 50)
            })
            .store(in: &subscriptions)
        
        wait(for: [loadGamesExpectation], timeout: 0.5)
    }
    
    func test_loadError() {
        let networkingServiceMock = NetworkingServiceMock(file: "api_search", error: NetworkingError.decoding)
        sut = GamesRepositoryImpl(networkingService: networkingServiceMock)
        let loadErrorExpectation = self.expectation(description: "Load error")
        sut?
            .loadGames()
            .sink(receiveCompletion: { (completion) in
                if case .failure(let error) = completion {
                    loadErrorExpectation.fulfill()
                    XCTAssertTrue(error.isEqual(to: NetworkingError.other(NetworkingError.decoding)))
                } else {
                    XCTFail("Unexpected case")
                }
            }, receiveValue: { _ in
                
            })
            .store(in: &subscriptions)
        
        wait(for: [loadErrorExpectation], timeout: 0.5)
        
    }
}
