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
        switch appState.gamesState {
        case .loading:
            return Spinner(isAnimating: true, style: .medium).eraseToAnyView()
        case .error(let error):
            return Text(error.localizedDescription).eraseToAnyView()
        case .loaded(let games):
            return list(games: games).eraseToAnyView()
        }
    }

    private func list(games: [GameItem]) -> some View {
        return List(games) { game in
            NavigationLink(
                destination: GameDetailView.make(game: game),
                label: {
                    GamesListView.Row(game: game)
                }
            )
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

extension GamesListView {
    static func make() -> some View {
        let appState = GamesListAppState()
        let repository = GamesRepositoryImpl(networkingService: BoardGameAtlasNetworkingServiceImpl())
        let interactor = GamesListInteractorImpl(gamesRepository: repository, appState: appState)
        return GamesListView(interactor: interactor)
            .environmentObject(appState)
    }

    static func makeMock(state: GamesListState) -> some View {
        let appState = GamesListAppState()
        var repositoryMock: GamesRepository
        switch state {
        case .loading:
            let networkingServiceMock = NetworkingServiceMock(isLoading: true)
            repositoryMock = GamesRepositoryImpl(networkingService: networkingServiceMock)
        case .error(let error):
            let networkingError = NetworkingError.other(error)
            let networkingServiceMock = NetworkingServiceMock(error: networkingError)
            repositoryMock = GamesRepositoryImpl(networkingService: networkingServiceMock)
        case .loaded(let games):
            repositoryMock = GamesRepositoryMock(games: games)
        }
        let interactor = GamesListInteractorImpl(gamesRepository: repositoryMock, appState: appState)
        return GamesListView(interactor: interactor)
            .environmentObject(appState)
    }
}

struct GamesListView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            GamesListView.makeMock(state: .loading)
                .previewDisplayName("Loading")
            GamesListView.makeMock(state: .error(NetworkingError.endpoint))
                .previewDisplayName("Error")
            GamesListView.makeMock(state: .loaded([]))
                .previewDisplayName("Empty list")
            GamesListView.makeMock(state: .loaded(GamesRepositoryMock.gamesMock()))
                .previewDisplayName("Games list")
        }
    }

}
