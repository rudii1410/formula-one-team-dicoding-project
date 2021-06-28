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
    
    func setData(data: InfoItem) {
        title.text = data.title
        desc.text = data.desc
    }
    
}
