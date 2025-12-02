//
//  AppStateObject.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Combine
import Foundation

// MARK: - AppStateObject

/// An observable object that holds the application state for the app.
/// It contains a published property `state` of type `AppState`.

final class AppStateObject: ObservableObject {
    @MainActor
    @Published var state: AppState

    init(state: AppState) {
        _state = .init(wrappedValue: state)
    }
}

// MARK: - AppStateObject Initializer

/// Convenience initializer for `AppStateObject` that sets up the initial state with a given `TalentLandAPI`.
/// This initializer creates an instance of `AppStateServices` using the provided `TalentLandAPI` and initializes the state
/// with it.

extension AppStateObject {
    convenience init(
        talentLandAPI: TalentLandAPI
    ) {
        let services = AppStateServices.make(
            talentLandAPI: talentLandAPI
        )
        let stateDate = AppState.StateData(
            services: services
        )
        self.init(
            state: .initial(stateDate)
        )
    }
}
