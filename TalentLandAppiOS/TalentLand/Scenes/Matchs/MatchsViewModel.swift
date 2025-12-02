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

    @Published var matchs: [Match]
    @Published var state: State

    // MARK: Initializers and deinitializers

    deinit {
        // Remove all useless things
    }

    init(
        dependencies: Dependencies,
        state: State = .initial,
    ) {
        self.dependencies = dependencies
        self.state = state
        self.matchs = []
    }

    // MARK: - Cycle methods

    func viewDidAppear() {
        getAllMatchs()
    }
}

// MARK: - Public API

extension MatchsViewModel {
    func refreshMatchs() {
        getAllMatchs()
    }

    func setNavigation(navigation: MatchsWireframeProtocol) {
        self.navigation = navigation
    }
}

// MARK: - Private methods for API

private extension MatchsViewModel {
    func getAllMatchs() {
        Task {
            do {
                let request = GetMatchsRequest()
                let response = try await dependencies.getMatchs(request)
                matchs = response.matchs
            } catch let error {
                print(
                    "Error getting matches \(error.localizedDescription)",
                )
            }
        }
    }
}
