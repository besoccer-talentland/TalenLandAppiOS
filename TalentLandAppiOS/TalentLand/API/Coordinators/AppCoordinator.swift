//
//  AppCoordinator.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Combine
import SwiftUI

// MARK: - AppCoordinator

/// The `AppCoordinator` is responsible for managing the app's main flow and state.
/// It initializes the app's root view and observes changes in the app state.
/// It creates the initial scene and listens for state changes to update the UI accordingly.

@MainActor
final class AppCoordinator: ObservableObject {
    // MARK: - Private Properties

    private let appStateObject: AppStateObject
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Public Published Properties

    @Published var rootView: AnyView?

    // MARK: - Initializer

    init(appStateObject: AppStateObject) {
        self.appStateObject = appStateObject
        createInitialScene()
        observeState()
    }
}

// MARK: - AppCoordinator Private Methods

private extension AppCoordinator {
    /// Creates the initial scene for the app by setting up the `ListWireframe`.
    /// This method initializes the `ListWireframe` with the current `appStateObject`
    /// and assigns its view to the `rootView` property.

    func createInitialScene() {
        let wireframe = MatchsWireframe(
            appStateObject: appStateObject
        )
        rootView = wireframe.view
    }

    /// Observes changes in the app state and updates the UI accordingly.
    /// It listens for changes to the `state` property of the `appStateObject`
    /// and performs actions based on the current state.
    /// This method currently has no specific actions for the `.initial` and `.loaded` states,
    /// but it can be extended in the future to handle state changes appropriately.

    func observeState() {
        appStateObject.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self else { return }
                switch state {
                case .initial:
                    break
                case .loaded:
                    break
                }
            }
            .store(in: &cancellables)
    }
}
