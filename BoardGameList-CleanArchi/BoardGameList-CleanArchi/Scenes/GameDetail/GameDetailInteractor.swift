//
//  GameDetailInteractor.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

protocol GameDetailInteractor {
    func loadGame()
}

class GameDetailInteractorImpl: GameDetailInteractor {
    let game: GameItemDetail
    let appState: GameDetailAppState

    init(game: GameItem,
         appState: GameDetailAppState) {
        self.game = GameItemDetail(game: game)
        self.appState = appState
    }

    func loadGame() {
        self.appState.gameState = .loaded(game)
    }
}
