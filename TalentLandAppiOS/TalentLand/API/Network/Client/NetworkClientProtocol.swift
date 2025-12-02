//
//  NetworkClientProtocol.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(endpoint: any Endpoint) async throws -> T
}
