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
        List {
            let matchs = viewModel.matchs
            ForEach(matchs, id: \.id) { match in
                ZStack(alignment: .topTrailing) {
                    VStack(spacing: 0) {
                        let isFirst = match == matchs.first
                        let isLast = match == matchs.last
                        MatchView(
                            match: match,
                            isFirst: isFirst,
                            isLast: isLast
                        )
                        SeparatorView(
                            isLast: isLast
                        )
                    }
                    BadgeView(match: match)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(
                    EdgeInsets(
                        top: 0,
                        leading: 10,
                        bottom: 0,
                        trailing: 10,
                    ),
                )
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.containerBackground))
        .environment(\.defaultMinListRowHeight, 0)
        .padding(.top, 10)
        .refreshable {
            viewModel.refreshMatchs()
        }
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
