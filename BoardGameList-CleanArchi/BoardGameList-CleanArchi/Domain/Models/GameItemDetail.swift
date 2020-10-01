//
//  GameItemDetail.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Rswift

struct GameItemDetail: Identifiable, Equatable {
    let id: String
    let name: String?
    let imageURL: URL?
    let description: String
    let playersTitle: String
    let playersText: String
    let descriptionTitle: String

    init(game: GameItem) {
        id = game.id
        name = game.name
        imageURL = game.imageURL
        description = game.description ?? ""
        
        playersTitle = R.string.localizable.game_detail_players() + ":"
        playersText = "\(game.minPlayers) - \(game.maxPlayers)"
        descriptionTitle = R.string.localizable.game_detail_description() + ":"
    }
}
