//
//  ImageSliderCell.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 23/06/21.
//

import UIKit

class ImageSliderCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageSlider: UIScrollView!
    private var data: ImageSlider!
    
    private let imageSize = 150
    private let imagePadding = 6
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: ImageSlider) {
        self.data = data
        
        title.text = data.title
        let count = data.imagesUrl.count
        imageSlider.contentSize = CGSize(width: count * (imageSize + imagePadding), height: 0)
        for (i, url) in data.imagesUrl.enumerated() {
            guard let imageUrl = URL(string: url) else { return }
            
            let imageView = UIImageView()
            imageView.fromUrl(from: imageUrl)
            imageView.contentMode = .scaleToFill
            imageView.frame = CGRect(x: getImageXPos(idx: i), y: 0, width: imageSize, height: imageSize)
            
            let singleTap = ImageTapGesture(target: self, action: #selector(onImageSelected))
            singleTap.numberOfTapsRequired = 1
            singleTap.idx = i
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(singleTap)
            
            imageSlider.addSubview(imageView)
        }
    }
    
    private func getImageXPos(idx: Int) -> Int {
        return (imageSize * idx) + ((idx * 1) * imagePadding)
    }
    
    @objc private func onImageSelected(sender: ImageTapGesture) {
        self.data.onImagesClick(sender.idx)
    }
    
}

class ImageTapGesture : UITapGestureRecognizer {
    var idx = Int()
}
