//
//  GameItem.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation

struct GameItem: Identifiable, Equatable {
    let id: String
    let name: String?
    let imageURL: URL?
    let thumbURL: URL?
    let description: String?
    let minPlayers: Int
    let maxPlayers: Int

    init(game: GameDTO) {
        id = game.id
        name = game.name
        imageURL = game.imageUrl
        thumbURL = game.thumbUrl
        description = game.description
        minPlayers = game.minPlayers
        maxPlayers = game.maxPlayers
    }
}
