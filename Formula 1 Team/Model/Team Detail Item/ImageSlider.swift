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
    
    init(title: String, imagesUrl: [String]) {
        self.title = title
        self.imagesUrl = imagesUrl
    }
}
