//
//  HomeView.swift
//  SwiftCoin
//
//  Created by Thomas Garayua on 1/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // top mvers view
                TopMoversView()
                // all coins view
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}