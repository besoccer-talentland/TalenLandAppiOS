//
//  BaseWireframe.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

// MARK: - BaseWireframe

/// A base wireframe that conforms to `BaseWireframeProtocol`.
/// It provides a mechanism to store and retrieve a SwiftUI view wrapped in `AnyView`.
/// This class is intended to be subclassed for specific wireframes in the application.

class BaseWireframe: BaseWireframeProtocol {
    // MARK: - Private Properties

    private var _view: AnyView?
    private var _temporaryStoredView: AnyView?

    // MARK: - Initializer

    init<V: View>(view: V) {
        let wrapped = AnyView(view)
        _temporaryStoredView = wrapped
        _view = wrapped
    }
}

// MARK: - BaseWireframe Extension

/// This extension provides a computed property to access the view.
extension BaseWireframe {
    // MARK: - Computed Properties

    var view: AnyView? {
        defer { _temporaryStoredView = nil }
        return _view
    }
}
