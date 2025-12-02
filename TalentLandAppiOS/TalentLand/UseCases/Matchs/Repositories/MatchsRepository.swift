//
//  MatchsRepository.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Combine

public protocol MatchsRepository {
    func getMatchs(request: GetMatchsRequest) async throws -> GetMatchsResponse
}
