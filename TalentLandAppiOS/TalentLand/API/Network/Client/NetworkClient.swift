//
//  NetworkClient.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

final class NetworkClient {
    private let baseURL: URL
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    init(
        baseURL: URL,
        session: URLSession = .shared,
        jsonDecoder: JSONDecoder = JSONDecoder(),
        jsonEncoder: JSONEncoder = JSONEncoder(),
    ) {
        self.baseURL = baseURL
        self.session = session
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }
}

extension NetworkClient: NetworkClientProtocol {
    func request<T: Decodable>(endpoint: any Endpoint) async throws -> T {
        guard
            var urlComponents = URLComponents(
                url: baseURL,
                resolvingAgainstBaseURL: true,
            )
        else {
            throw ErrorNetwork.invalidURL
        }

        if let endpointPath = endpoint.path {
            let basePath = urlComponents.path
            if basePath.hasSuffix("/") {
                urlComponents.path = basePath + endpointPath
            } else {
                urlComponents.path = basePath + "/" + endpointPath
            }
        }

        let queryItems = URL.queryItems(
            requiresAuth: endpoint.requiresAuth,
        )
        urlComponents.queryItems = queryItems
        endpoint.queryItems?.forEach {
            urlComponents.queryItems?.append($0)
        }

        guard let url = urlComponents.url else {
            throw ErrorNetwork.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type",
        )
        if let body = endpoint.body {
            request.httpBody = try jsonEncoder.encode(
                AnyEncodable(body),
            )
        }

        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ErrorNetwork.serverError(-1, data)
            }
            switch httpResponse.statusCode {
            case 200..<300:
                if T.self == EmptyResponse.self {
                    return EmptyResponse() as! T
                }
                return try jsonDecoder.decode(T.self, from: data)
            default:
                throw ErrorNetwork.serverError(httpResponse.statusCode, data)
            }
        } catch let error as DecodingError {
            throw ErrorNetwork.decodingError(error)
        } catch {
            throw ErrorNetwork.unknown(error)
        }
    }
}
