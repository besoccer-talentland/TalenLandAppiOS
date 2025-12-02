//
//  AppState.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - AppState

/// The `AppState` enum represents the state of the application, encapsulating the services it uses.
/// It has two cases: `initial` and `loaded`, each containing a `StateData` struct that holds the services.
/// In this case only the `initial` case will be used, but I also wanted to prepare the enum for the future.

enum AppState {
    // MARK: - StateData

    struct StateData {
        let services: AppStateServices
    }

    // MARK: - Cases

    case initial(StateData)
    case loaded(StateData)

    // MARK: - Computed Properties

    var stateData: StateData {
        get {
            switch self {
            case .initial(let stateData):
                stateData
            case .loaded(let stateData):
                stateData
            }
        }

        set {
            switch self {
            case .initial:
                self = .initial(newValue)
            case .loaded:
                self = .loaded(newValue)
            }
        }
    }
}
