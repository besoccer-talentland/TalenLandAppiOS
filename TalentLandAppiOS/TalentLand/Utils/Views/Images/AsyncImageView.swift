//
//  AsyncImageView.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

struct AsyncImageView: View {
    // MARK: - Properties

    let url: String?
    var containerSize: CGFloat = 25
    var isCircular: Bool = false

    // MARK: - Private Properties

    private var contentSize: CGFloat {
        containerSize * 0.70
    }
    private var containerCornerRadius: CGFloat {
        isCircular ? containerSize / 2 : 0
    }

    // MARK: - State Objects

    @StateObject private var loader: ImageLoader

    // MARK: - Initializer

    init(
        url: String?,
        containerSize: CGFloat = 25,
        isCircular: Bool = false,
    ) {
        self.url = url
        self.containerSize = containerSize
        self.isCircular = isCircular
        _loader = StateObject(
            wrappedValue: ImageLoader(
                urlString: url,
            ),
        )
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            Color.white
                .frame(
                    width: containerSize,
                    height: containerSize,
                )
            Group {
                if let ui = loader.image {
                    Image(uiImage: ui)
                        .resizable()
                        .scaledToFit()
                        .frame(width: contentSize, height: contentSize)
                        .foregroundColor(.white)
                } else {
                    ProgressView()
                        .frame(width: contentSize, height: contentSize)
                        .opacity(0.6)
                }
            }
        }
        .clipShape(
            RoundedRectangle(
                cornerRadius: containerCornerRadius,
            ),
        )
        .frame(width: containerSize, height: containerSize)
        .onChange(of: url) { _, newValue in
            loader.load(urlString: newValue)
        }
    }
}
