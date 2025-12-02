//
//  URL+QueryItems.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

extension URL {
    static func queryItems(
        requiresAuth: Bool,
    )
        -> [URLQueryItem]
    {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "device", value: "iphone"),
        ]
        return queryItems
    }
}
