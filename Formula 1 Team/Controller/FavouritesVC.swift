//
//  FavouritesVC.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 14/06/21.
//

import UIKit

class FavouritesVC: UIViewController, UITableViewDataSource {

    private let FAVOURITES_TEAM_CELL_ID = "favourites_team_id"
    private var favouritesTeam: [String] = []
    @IBOutlet private weak var favouriteTeamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteTeamsTableView.dataSource = self
        favouriteTeamsTableView.register(
            UINib(nibName: "TeamCell", bundle: nil),
            forCellReuseIdentifier: FAVOURITES_TEAM_CELL_ID
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = favouriteTeamsTableView.dequeueReusableCell(withIdentifier: FAVOURITES_TEAM_CELL_ID, for: indexPath) as? TeamCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
