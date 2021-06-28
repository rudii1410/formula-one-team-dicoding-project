//
//  TeamCell.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 14/06/21.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet private weak var teamImage: UIImageView!
    @IBOutlet private weak var teamName: UILabel!
    @IBOutlet private weak var teamOrigin: UILabel!
    
    func setData(teamImage img: URL, teamName name: String, teamOrigin origin: String) {
        teamImage.fromUrl(from: img)
        teamName.text = name
        teamOrigin.text = origin
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamImage.layer.cornerRadius = teamImage.frame.height / 2
        teamImage.layer.borderWidth = 1
        teamImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
