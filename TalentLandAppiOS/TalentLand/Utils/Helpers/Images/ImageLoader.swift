//
//  ImageLoader.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import Combine
import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var task: Task<Void, Never>?
    private var urlString: String?
    private let cachePolicy: URLRequest.CachePolicy

    deinit {
        task?.cancel()
    }

    init(
        urlString: String?,
        cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad,
    ) {
        self.cachePolicy = cachePolicy
        self.urlString = urlString
        start()
    }

    func load(urlString: String?) {
        if
            self.urlString == urlString,
            image != nil
        {
            return
        }
        task?.cancel()
        image = nil
        self.urlString = urlString
        start()
    }

    private func start() {
        guard
            let urlString,
            let url = URL(string: urlString)
        else {
            return
        }
        if
            let cached = ImageCache.shared.object(
                forKey: urlString as NSString,
            )
        {
            image = cached
            return
        }

        task = Task { [weak self] in
            guard
                let self,
                !Task.isCancelled
            else {
                return
            }
            do {
                let request = URLRequest(
                    url: url,
                    cachePolicy: cachePolicy,
                    timeoutInterval: 30,
                )
                let (data, _) = try await URLSession.shared.data(for: request)
                if Task.isCancelled {
                    return
                }
                if let ui = UIImage(data: data) {
                    ImageCache.shared.setObject(
                        ui,
                        forKey: urlString as NSString,
                    )
                    image = ui
                }
            } catch let error {
                print("Error: ImageLoader - \(error)")
            }
        }
    }

    func reload() {
        load(urlString: urlString)
    }
}
