//
//  URLSession+Data.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

extension URLSession {
    func getData(
        for request: URLRequest,
    ) async throws
        -> (data: Data, response: HTTPURLResponse)
    {
        do {
            let (data, response) = try await data(for: request)
            guard let httpResponse = response as? HTTPURLResponse
            else {
                throw NSError()
            }
            return (data, httpResponse)
        } catch {
            throw error
        }
    }

    func postData(
        for request: URLRequest,
    ) async throws
        -> (data: Data, response: HTTPURLResponse)
    {
        var postRequest = request
        postRequest.httpMethod = HTTPMethod.post.rawValue
        let (data, response) = try await data(for: postRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError()
        }
        return (data, httpResponse)
    }
}
