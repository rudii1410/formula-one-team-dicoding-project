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
    
    private let placeholderImage = UIImage(named: "placeholder")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamLogo.layer.cornerRadius = teamLogo.frame.height / 2
        teamLogo.clipsToBounds = true
    }
    
    func setData(data: BannerItem) {
        if let bannerUrl = data.teamBannerUrl { teamBanner.fromUrl(from: bannerUrl) } else { teamBanner.image = placeholderImage }
        if let teamLogoUrl = data.teamLogoUrl { teamLogo.fromUrl(from: teamLogoUrl) } else { teamLogo.image = placeholderImage }
    }
}
