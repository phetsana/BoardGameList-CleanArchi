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

    init(interactor: GameDetailInteractor) {
        self.interactor = interactor
    }

    var body: some View {
        content
            .navigationTitle(appState.game.name ?? "")
            .onAppear { interactor.loadGame() }
    }

    private var content: some View {
        return ScrollView {
            GameDetailView.Content(game: appState.game)
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

extension GameDetailView {
    static func make(game: GameItem) -> some View {
        let appState = GameDetailAppState(game: GameItemDetail(game: game))
        let interactor = GameDetailInteractorImpl(game: game, appState: appState)
        return GameDetailView(interactor: interactor)
                .environmentObject(appState)
    }
    
    static func makeMock() -> some View {
        let game = GamesRepositoryMock.game2()
        let appState = GameDetailAppState(game: GameItemDetail(game: game))
        let interactor = GameDetailInteractorImpl(game: game, appState: appState)
        return GameDetailView(interactor: interactor)
                .environmentObject(appState)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    #if DEBUG
    static var previews: some View {
        Group {
            GameDetailView.makeMock()
                .previewDisplayName("Detail view")
        }
    }
    #endif
}
