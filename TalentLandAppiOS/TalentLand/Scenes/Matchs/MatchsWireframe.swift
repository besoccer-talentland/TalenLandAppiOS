//
//  MatchsWireframe.swift
//  BeSoccer
//
//  Created by BeSoccer on 7/10/25.
//  Copyright (c) 2025. All rights reserved.

import UIKit

@MainActor
final class MatchsWireframe: BaseWireframe {
    // MARK: - Private Properties

    private var appStateObject: AppStateObject
    private var moduleView: MatchsView

    // MARK: - Initializers

    init(
        appStateObject: AppStateObject,
        state: MatchsViewModel.State = .initial,
    ) {
        self.appStateObject = appStateObject
        let stateData = appStateObject.state.stateData
        let matchsService = stateData.services.matchs()
        let viewModel = MatchsViewModel(
            dependencies: .init(
                getMatchs: matchsService.getMatchs,
            ),
            state: state,
        )
        self.moduleView = MatchsView(
            viewModel: viewModel,
        )
        super.init(view: moduleView)
        viewModel.setNavigation(navigation: self)
    }
}

// MARK: - MatchsWireframeProtocol

extension MatchsWireframe: MatchsWireframeProtocol {
    func navigate(to option: MatchsNavigationOption) {

    }
}
