//
//  ImageCache.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import UIKit

final class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
