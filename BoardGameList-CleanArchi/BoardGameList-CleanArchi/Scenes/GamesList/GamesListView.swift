//
//  GamesListView.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import SwiftUI

struct GamesListView: View {
    
    @EnvironmentObject var appState: GamesListAppState
    let interactor: GamesListInteractor
    
    var body: some View {
        NavigationView {
            content
                .navigationBarTitle(R.string.localizable.game_list_title(), displayMode: .inline)
        }
        .onAppear { interactor.loadGames() }
    }
    
    private var content: some View {
        if appState.games.isEmpty {
            return Spinner(isAnimating: true, style: .medium).eraseToAnyView()
        }
        
        return list()
            .eraseToAnyView()
    }

    private func list() -> some View {
        return List(appState.games) { game in
            let appState = GameDetailAppState()
            let interactor = GameDetailInteractorImpl(game: game, appState: appState)
            NavigationLink(
                destination: GameDetailView(interactor: interactor)
                    .environmentObject(appState),
                label: {
                    GamesListView.Row(game: game)
                })
        }
    }
}

extension GamesListView {
    struct Row: View {
        let game: GameItem

        var body: some View {
            HStack {
                image.frame(width: 100, height: 100, alignment: .center)
                name
            }
        }

        private var name: some View {
            Text(game.name ?? "")
                .font(.title)
                .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
        }

        private var image: some View {
            return game.thumbURL.map { url in
                RemoteImage(url: url)
            }
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
