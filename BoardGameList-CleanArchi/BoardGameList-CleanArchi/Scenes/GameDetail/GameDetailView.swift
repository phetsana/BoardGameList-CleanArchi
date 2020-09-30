//
//  GameDetailView.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject var appState: GameDetailAppState
    let interactor: GameDetailInteractor

    var body: some View {
        content
            .navigationTitle(appState.game?.name ?? "")
            .onAppear { interactor.loadGame() }
    }

    private var content: some View {
        guard let game = appState.game else {
            return EmptyView().eraseToAnyView()
        }
        return ScrollView {
            GameDetailView.Content(game: game)
                .padding(20)
        }
        .eraseToAnyView()
    }
}

extension GameDetailView {
    struct Content: View {
        let game: GameItemDetail

        var body: some View {
            VStack {
                image
                players
                description
            }
        }

        private var image: some View {
            return game.imageURL.map { url in
                RemoteImage(url: url)
            }
        }

        private var players: some View {
            HStack {
                Text(game.playersTitle)
                    .bold()
                Text(game.playersText)
            }
        }

        private var description: some View {
            VStack {
                Text(game.descriptionTitle)
                    .bold()
                Text(game.description)
            }
            .eraseToAnyView()
        }
    }
}
