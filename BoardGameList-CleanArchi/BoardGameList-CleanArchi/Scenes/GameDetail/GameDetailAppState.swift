//
//  GameDetailAppState.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

enum GameDetailState: AutoEquatable {
    case loading
    case loaded(GameItemDetail)
}

class GameDetailAppState: ObservableObject {
    @Published var gameState: GameDetailState = .loading
}
