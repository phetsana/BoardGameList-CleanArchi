//
//  GamesListAppState.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

enum GamesListState: AutoEquatable {
    case loading
    case error(Error)
    case loaded([GameItem])
}

class GamesListAppState: ObservableObject {
    @Published var gamesState: GamesListState = .loading
}
