//
//  MatchsViewModel.swift
//  BeSoccer
//
//  Created by BeSoccer on 7/10/25.
//  Copyright (c) 2025. All rights reserved.

import Combine
import Foundation
import SwiftUI

@MainActor
final class MatchsViewModel: ObservableObject {
    // MARK: - State

    enum State: Equatable {
        case initial
    }

    // MARK: Dependencies

    struct Dependencies {
        let getMatchs: (GetMatchsRequest) async throws -> GetMatchsResponse
    }

    // MARK: Private properties

    private let dependencies: Dependencies
    private var navigation: MatchsWireframeProtocol?

    // MARK: Public properties

    @Published var state: State

    // MARK: Initializers and deinitializers

    deinit {

    }

    init(
        dependencies: Dependencies,
        state: State = .initial,
    ) {
        self.dependencies = dependencies
        self.state = state
    }

    // MARK: - Cycle methods

    func viewDidAppear() {

    }
}

// MARK: - Public API

extension MatchsViewModel {
    func setNavigation(navigation: MatchsWireframeProtocol) {
        self.navigation = navigation
    }
}

// MARK: - Private methods for API

private extension MatchsViewModel {

}
