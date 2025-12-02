//
//  Endpoint.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

protocol Endpoint {
    associatedtype Response: Decodable
    var method: HTTPMethod { get }
    var path: String? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Encodable? { get }
    var requiresAuth: Bool { get }
}
