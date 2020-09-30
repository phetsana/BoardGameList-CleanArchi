//
//  GamesListInteractor.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

protocol GamesListInteractor {
    func loadGames()
}

class GamesListInteractorImpl: GamesListInteractor {
    let gamesListRepository: GamesListRepository
    let appState: GamesListAppState
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(gamesListRepository: GamesListRepository,
         appState: GamesListAppState) {
        self.gamesListRepository = gamesListRepository
        self.appState = appState
    }
    
    deinit {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
    
    func loadGames() {
        gamesListRepository
            .loadGames()
            .sink { (_) in
                
            } receiveValue: { [weak self] (games) in
                self?.appState.games = games
            }
            .store(in: &subscriptions)
    }
}
