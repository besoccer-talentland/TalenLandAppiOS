//
//  AppStateMatchsRepository.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - AppStateMatchsSRepository

/// A service that provides access to betting-related operations within the app state.
/// This service is designed to be used within the app state management system, allowing for
/// asynchronous updates of related functionalities.
/// It encapsulates the logic for updating odds by interacting with `MatchsRepository`, but more logics
/// can be added as needed in the future.

final class AppStateMatchsRepository {
    // MARK: - Type Aliases

    typealias GetMatchs = (GetMatchsRequest) async throws -> GetMatchsResponse

    // MARK: - Properties

    let getMatchs: GetMatchs

    // MARK: - Initializer

    init(getMatchs: @escaping GetMatchs) {
        self.getMatchs = getMatchs
    }
}

// MARK: - AppStateMatchsServices Initializer

/// Convenience initializer for `AppStateMatchsRepository` that sets up the service with a given `MatchsRepository`.
/// This initializer creates an instance of `MatchsRepository` using the provided `MatchsRepository` and initializes the service
/// with it.

extension AppStateMatchsRepository {
    // MARK: - Static Methods

    static func make(
        matchsRepository: any MatchsRepository
    )
        -> AppStateMatchsRepository
    {
        self.init(
            matchsRepository: matchsRepository
        )
    }

    // MARK: - Convenience Initializer

    convenience init(
        matchsRepository: some MatchsRepository
    ) {
        self.init(getMatchs: matchsRepository.getMatchs)
    }
}
