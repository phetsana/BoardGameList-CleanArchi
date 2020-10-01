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
    let gamesRepository: GamesRepository
    let appState: GamesListAppState
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(gamesRepository: GamesRepository,
         appState: GamesListAppState) {
        self.gamesRepository = gamesRepository
        self.appState = appState
    }
    
    deinit {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
    
    func loadGames() {
        appState.gamesState = .loading
        gamesRepository
            .loadGames()
            .sink { [weak self] (completion) in
                if case let .failure(error) = completion {
                    self?.appState.gamesState = .error(error)
                }
            } receiveValue: { [weak self] (games) in
                self?.appState.gamesState = .loaded(games)
            }
            .store(in: &subscriptions)
    }
}
