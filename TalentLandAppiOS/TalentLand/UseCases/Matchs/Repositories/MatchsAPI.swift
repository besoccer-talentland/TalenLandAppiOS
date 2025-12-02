//
//  MatchsAPI.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - MatchsAPI

final class MatchsAPI {
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension MatchsAPI: MatchsRepository {
    func getMatchs(request: GetMatchsRequest) async throws -> GetMatchsResponse {
        try await networkClient.request(
            endpoint: GetMatchsEndpoint.getMatchs(
                request: request
            ),
        ) as GetMatchsResponse
    }
}
