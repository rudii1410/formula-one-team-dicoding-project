//
//  InfoItemCell.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import UIKit

class InfoItemCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: InfoItem) {
        title.text = data.title
        desc.text = data.desc
    }
    
}
