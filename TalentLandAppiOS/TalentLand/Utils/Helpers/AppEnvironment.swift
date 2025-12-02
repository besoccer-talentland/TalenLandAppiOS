//
//  AppEnvironment.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

enum AppEnvironment {
    static func makeAppStateObject() -> AppStateObject {
        guard let baseURL = NetworkEnvironment.current.baseURL else {
            fatalError("The app cannot initiate")
        }
        let api = TalentLandAPIRepositories(
            networkClient: NetworkClient(baseURL: baseURL)
        )
        return AppStateObject(
            talentLandAPI: api
        )
    }
}

#if DEBUG
extension AppEnvironment {
    static func makePreviewAppStateObject() -> AppStateObject {
        makeAppStateObject()
    }
}
#endif
