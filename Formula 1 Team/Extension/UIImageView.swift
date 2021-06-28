//
//  UIImage.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import Foundation
import UIKit

extension UIImageView {
    func fromUrl(from url: URL) {
        image = UIImage(named: "placeholder")
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
        
        dataTask.resume()
    }
}
