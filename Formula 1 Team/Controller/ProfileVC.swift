//
//  ProfileVC.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 22/06/21.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 8
        profileImage.clipsToBounds = true
        
        guard let url = URL(string: "https://rudiyanto.dev/img/self.jpg") else { return }
        profileImage.fromUrl(from: url)
    }
    
    
    @IBAction func webBtnPressed(_ sender: Any) {
        guard let url = URL(string: "https://rudiyanto.dev/") else { return }
        UIApplication.shared.open(url)
    }
}
