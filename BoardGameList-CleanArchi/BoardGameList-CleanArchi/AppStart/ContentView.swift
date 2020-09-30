//
//  ContentView.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let appState = GamesListAppState()
        let repository = GamesListRepositoryImpl(networkingService: BoardGameAtlasNetworkingServiceImpl())
        let interactor = GamesListInteractorImpl(gamesListRepository: repository, appState: appState)
        return GamesListView(interactor: interactor)
            .environmentObject(appState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
