//
//  MatchsRepositoryImplementation.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Combine

final class MatchsRepositoryImplementation {
    private let api: MatchsAPI

    init(
        api: MatchsAPI,
    ) {
        self.api = api
    }
}

extension MatchsRepositoryImplementation: MatchsRepository {
    func getMatchs(request: GetMatchsRequest) async throws -> GetMatchsResponse {
        let response = try await api.getMatchs(request: request)
        return response
    }
}
