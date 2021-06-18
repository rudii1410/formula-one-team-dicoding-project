//
//  BannerItemCell.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import UIKit

class BannerItemCell: UITableViewCell {

    @IBOutlet weak var teamBanner: UIImageView!
    @IBOutlet weak var teamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamLogo.layer.cornerRadius = teamLogo.frame.height / 2
        teamLogo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: BannerItem) {
        teamBanner.fromUrl(from: data.teamBannerUrl)
        teamLogo.fromUrl(from: data.teamLogoUrl)
    }
}
