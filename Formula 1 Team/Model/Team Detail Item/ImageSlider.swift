//
//  File.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 23/06/21.
//

import Foundation

class ImageSlider : TeamDetailItem {
    var type: TeamDetailItemType {
        return .imageSlider
    }
    
    var title: String
    var imagesUrl: [String]
    var onImagesClick: (Int) -> Void
    
    init(title: String, imagesUrl: [String], onImageClick: @escaping (Int) -> Void) {
        self.title = title
        self.imagesUrl = imagesUrl
        self.onImagesClick = onImageClick
    }
}
