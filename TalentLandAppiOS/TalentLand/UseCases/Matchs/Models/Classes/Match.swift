//
//  Match.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

public class Match: Decodable, Equatable {
    let id: UUID = .init()
    let localName: String?
    let localShield: String?
    let visitorName: String?
    let visitorShield: String?
    let score: String?
    let liveMinute: Int?

    enum CodingKeys: String, CodingKey {
        case localName
        case localShield
        case visitorName
        case visitorShield
        case score
        case liveMinute
    }

    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(
            keyedBy: CodingKeys.self
        )
        localName = try? container.decodeIfPresent(
            String.self,
            forKey: .localName
        )
        localShield = try? container.decodeIfPresent(
            String.self,
            forKey: .localShield
        )
        visitorName = try? container.decodeIfPresent(
            String.self,
            forKey: .visitorName
        )
        visitorShield = try? container.decodeIfPresent(
            String.self,
            forKey: .visitorShield
        )
        score = try? container.decodeIfPresent(
            String.self,
            forKey: .score
        )
        liveMinute = try? container.decodeIfPresent(
            Int.self,
            forKey: .liveMinute
        )
    }

    public static func ==(lhs: Match, rhs: Match) -> Bool {
        lhs.id == rhs.id
    }
}
