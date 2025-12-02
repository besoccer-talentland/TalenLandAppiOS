//
//  TalentLandAPIRepositories.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - TalentLandAPIRepositories

final class TalentLandAPIRepositories: TalentLandAPI {
    private let networkClient: NetworkClient

    // MARK: - Initialization

    init(
        networkClient: NetworkClient,
    ) {
        self.networkClient = networkClient
    }

    // MARK: - TalentLandAPIRepositories Methods

    func matchs() -> any MatchsRepository {
        MatchsRepositoryImplementation(
            api: MatchsAPI(networkClient: networkClient),
        )
    }
}
