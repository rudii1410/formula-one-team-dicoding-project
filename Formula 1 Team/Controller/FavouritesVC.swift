//
//  FavouritesVC.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 14/06/21.
//

import UIKit

class FavouritesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let FAVOURITES_TEAM_CELL_ID = "favourites_team_id"
    private var favouritesTeam: [FormulaOneTeam] = []
    @IBOutlet private weak var favouriteTeamsTableView: UITableView!
    let repo = FormulaTeamRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouriteTeamsTableView.dataSource = self
        favouriteTeamsTableView.delegate = self
        favouriteTeamsTableView.register(
            UINib(nibName: "TeamCell", bundle: nil),
            forCellReuseIdentifier: FAVOURITES_TEAM_CELL_ID
        )
    }
    
    private func fetchFavouritesTeam() {
        favouritesTeam = repo.getAllFavouritesTeam()
        favouriteTeamsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = favouritesTeam.count
        if count == 0 {
            self.favouriteTeamsTableView.setEmptyMessage("Belum ada tim favourite")
        } else {
            self.favouriteTeamsTableView.restore()
        }
        return favouritesTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = favouriteTeamsTableView.dequeueReusableCell(withIdentifier: FAVOURITES_TEAM_CELL_ID, for: indexPath) as? TeamCell {
            let data = self.favouritesTeam[indexPath.row]
            cell.setData(teamImage: URL(string: data.strTeamLogo!)!, teamName: data.strTeam!, teamOrigin: data.strCountry!)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = TeamDetailVC(nibName: "TeamDetailVC", bundle: nil)
        detail.setData(data: self.favouritesTeam[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchFavouritesTeam()
    }
}
