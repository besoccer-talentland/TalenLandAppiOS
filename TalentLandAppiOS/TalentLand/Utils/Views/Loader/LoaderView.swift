//
//  LoaderView.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

// MARK: - LoaderView

/// A view that displays a loading indicator with a semi-transparent background.
/// This view is typically used to indicate that data is being loaded or processed.
/// It features a circular progress view centered on the screen.
/// - Note: The background color is set to a semi-transparent black to dim the underlying content
/// while the loading indicator is visible.

struct LoaderView: View {
    // MARK: - Body

    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(
                        tint: .primary
                    )
                )
                .frame(width: 125, height: 100)
                .background(Color.clear)
        }
    }
}
