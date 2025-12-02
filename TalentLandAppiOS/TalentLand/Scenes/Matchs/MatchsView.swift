//
//  MatchsView.swift
//  BeSoccer
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

struct MatchsView: View {
    // MARK: - Observed Objects

    @ObservedObject var viewModel: MatchsViewModel

    // MARK: - Body

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

#Preview {
    let appStateObject = AppEnvironment.makePreviewAppStateObject()
    let stateData = appStateObject.state.stateData
    let matchsService = stateData.services.matchs()
    let viewModel = MatchsViewModel(
        dependencies: .init(
            getMatchs: matchsService.getMatchs
        )
    )
    return MatchsView(
        viewModel: viewModel
    )
    .environmentObject(appStateObject)
}
