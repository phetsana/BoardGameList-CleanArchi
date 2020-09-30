//
//  GameDetailAppState.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

class GameDetailAppState: ObservableObject {
    @Published var game: GameItemDetail?
}
