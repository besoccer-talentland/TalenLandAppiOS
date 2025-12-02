//
//  NetworkInteractor.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

protocol NetworkInteractor {
    var session: URLSession { get }
}

extension NetworkInteractor {
    public func getRequest<T: Decodable, E: Decodable & Error>(
        request: URLRequest,
        type: T.Type,
        errorType: E.Type,
    ) async throws
        -> T
    {
        print(
            "\(request.url?.absoluteString ?? "Unknown URL")",
        )
        let (data, response) = try await session.getData(for: request)
        guard response.statusCode == 200 else {
            print(
                "Bad status code (\(response.statusCode)) for: \(request.url?.absoluteString ?? "Unknown URL")",
            )
            if
                let errorResponse = try? JSONDecoder().decode(
                    E.self,
                    from: data,
                )
            {
                throw errorResponse
            }
            throw NSError()
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }

    public func postRequest<T: Decodable, E: Decodable & Error>(
        request: URLRequest,
        type: T.Type,
        errorType: E.Type,
    ) async throws
        -> T
    {
        print(
            "\(request.url?.absoluteString ?? "Unknown URL")",
        )
        let (data, response) = try await session.postData(for: request)
        guard response.statusCode == 200 else {
            print(
                "Bad status code (\(response.statusCode)) for: \(request.url?.absoluteString ?? "Unknown URL")",
            )
            if let errorResponse = try? JSONDecoder().decode(E.self, from: data) {
                throw errorResponse
            }
            throw NSError()
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }
}
