//
//  GetMatchsEndpoint.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

enum GetMatchsEndpoint: Endpoint {
    typealias Response = GetMatchsResponse
    case getMatchs(request: GetMatchsRequest)

    var method: HTTPMethod { .get }
    var queryItems: [URLQueryItem]? { nil }
    var path: String? {
        let pathToReturn: String = "matches"
        switch self {
        case .getMatchs:
            return pathToReturn + "/list"
        }
    }

    var body: Encodable? { nil }
    var requiresAuth: Bool { false }
}
