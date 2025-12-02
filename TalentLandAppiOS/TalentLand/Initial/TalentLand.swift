//
//  TalentLandApp.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

@main
struct TalentLandApp: App {
    @StateObject private var appStateObject: AppStateObject
    @StateObject private var appCoordinator: AppCoordinator

    init() {
        let appStateObject = AppEnvironment.makeAppStateObject()
        _appStateObject = StateObject(wrappedValue: appStateObject)
        _appCoordinator = StateObject(
            wrappedValue: AppCoordinator(appStateObject: appStateObject)
        )
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if let rootView = appCoordinator.rootView {
                    rootView
                        .environmentObject(appStateObject)
                } else {
                    LoaderView()
                }
            }
        }
    }
}
