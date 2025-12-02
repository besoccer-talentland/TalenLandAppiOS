//
//  GetMatchsResponse.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

public struct GetMatchsResponse: Decodable {
    let matchs: [Match]

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.matchs = (try? container.decode([Match].self)) ?? []
    }
}
