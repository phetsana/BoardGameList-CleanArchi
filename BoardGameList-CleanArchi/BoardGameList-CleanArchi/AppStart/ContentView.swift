//
//  ContentView.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return GamesListView.make()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
