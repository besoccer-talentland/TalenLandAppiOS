//
//  NetworkEnvironment.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

enum NetworkEnvironment: String {
    case debug
    case release

    var baseURL: URL? {
        switch self {
        case .debug:
            URL(
                string: "https://bs-api.besoccer.com/api/test/app",
            )
        case .release:
            // The release URL should be different than the debug URL. In this case it's the
            // same because it's a dummy app.
            URL(
                string: "https://bs-api.besoccer.com/api/test/app",
            )
        }
    }

    static var current: NetworkEnvironment {
        #if DEBUG
            .debug
        #else
            .release
        #endif
    }
}
