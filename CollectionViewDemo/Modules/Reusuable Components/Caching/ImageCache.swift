//
//  ImageCache.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/8/21.
//

import UIKit

final class ImageCache {
    
    
    
//    struct Configuration {
//        let countLimit: Int
//        let memoryLimit: Int
//    }
//    private lazy var imageCache: NSCache<UIImage, NSString> = {
//        let cache = NSCache<UIImage, NSString>()
//        cache.countLimit = config.countLimit
//        return cache
//    }()
//
//    private let config: Configuration
//
//    init(config: Configuration) {
//        self.config = config
//    }
    
    private lazy var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        return cache
    }()
    
    func saveImage(_ image: UIImage, for url: NSString) {
        imageCache.setObject(image, forKey: url)
    }
    func getImage(for url: NSString) -> UIImage? {
        imageCache.object(forKey: url)
    }
}
