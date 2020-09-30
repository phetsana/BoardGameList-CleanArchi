//
//  GamesListAppState.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

class GamesListAppState: ObservableObject {
    @Published var games: [GameItem] = []
}
