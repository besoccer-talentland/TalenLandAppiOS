//
//  AppStateServices.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - AppStateServices

/// Provides access to the services needed for the app state.
/// It contains a closure that returns an instance of `AppStateMatchsRepository`.
/// This class  is designed to be initialized with all the services needed by the app state.
/// It currently only includes a bets service, but can be extended in the future to include more services needed.

final class AppStateServices {
    // MARK: - Type Aliases

    typealias MatchsRepository = () -> AppStateMatchsRepository

    // MARK: - Properties

    let matchs: MatchsRepository

    // MARK: - Initializer

    init(matchs: @escaping MatchsRepository) {
        self.matchs = matchs
    }
}

// MARK: - AppStateServices Initializer

/// Convenience initializer for `AppStateServices` that sets up the bets service using a given `TalentLandAPI`.
/// This allows the app state to access the bets service through the provided API.
/// This is useful for initializing the app state with the necessary services for betting functionality.

extension AppStateServices {
    static func make(talentLandAPI: any TalentLandAPI) -> AppStateServices {
        self.init(
            matchs: {
                let matchsRepository = talentLandAPI.matchs()
                return AppStateMatchsRepository(matchsRepository: matchsRepository)
            }
        )
    }
}
