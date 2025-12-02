//
//  MatchsViewProtocols.swift
//  BeSoccer
//
//  Created by BeSoccer on 7/10/25.
//  Copyright (c) 2025. All rights reserved.

import SwiftUI
import UIKit

// MARK: - MatchsNavigationOption

enum MatchsNavigationOption {

}

// MARK: - MatchsWireframeProtocol

@MainActor
protocol MatchsWireframeProtocol: BaseWireframeProtocol {
    func navigate(to option: MatchsNavigationOption)
}
