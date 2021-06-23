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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: ImageSlider) {
        title.text = data.title
    }
    
}
