//
//  GetGamesRequestTests.swift
//  BoardGameList-CleanArchiTests
//
//  Created by Phetsana PHOMMARINH on 01/10/2020.
//

import XCTest
@testable import BoardGameList_CleanArchi

class GetGamesRequestTests: XCTestCase {
    func test_init() {
        var sut = GetGamesRequest(orderBy: .popularity, ascending: true, limit: 20)
        XCTAssertEqual(sut.parameters.count, 3)
        XCTAssertEqual(sut.parameters["order_by"] as? String, "popularity")
        XCTAssertEqual(sut.parameters["ascending"] as? Bool, true)
        XCTAssertEqual(sut.parameters["limit"] as? Int, 20)
        
        sut = GetGamesRequest(orderBy: .popularity, ascending: false, limit: 10)
        XCTAssertEqual(sut.parameters.count, 3)
        XCTAssertEqual(sut.parameters["order_by"] as? String, "popularity")
        XCTAssertEqual(sut.parameters["ascending"] as? Bool, false)
        XCTAssertEqual(sut.parameters["limit"] as? Int, 10)
    }
}
