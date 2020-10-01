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
            .navigationTitle(navigationTitle)
            .onAppear { interactor.loadGame() }
    }

    private var navigationTitle: String {
        switch appState.gameState {
        case .loading:
            return ""
        case .loaded(let game):
            return game.name ?? ""
        }
    }
    
    private var content: some View {
        switch appState.gameState {
        case .loading:
            return Spinner(isAnimating: true, style: .medium).eraseToAnyView()
        case .loaded(let game):
            return ScrollView {
                GameDetailView.Content(game: game)
                    .padding(20)
            }
            .eraseToAnyView()
        }
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
        let appState = GameDetailAppState()
        let interactor = GameDetailInteractorImpl(game: game, appState: appState)
        return GameDetailView(interactor: interactor)
                .environmentObject(appState)
    }
    
    static func makeMock() -> some View {
        let game = GamesRepositoryMock.game2()
        let appState = GameDetailAppState()
        let interactor = GameDetailInteractorImpl(game: game, appState: appState)
        return GameDetailView(interactor: interactor)
                .environmentObject(appState)
    }
}

#if DEBUG
struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameDetailView.makeMock()
                .previewDisplayName("Detail view")
        }
    }
}
#endif
