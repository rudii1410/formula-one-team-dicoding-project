//
//  TeamDetailVC.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import UIKit
import RealmSwift

class TeamDetailVC: UITableViewController {

    var items: [TeamDetailItem] = []
    var isFavourite: Bool = false
    var team: FormulaOneTeam? = nil
    let repo = FormulaTeamRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let favButton = UIBarButtonItem(image: getFavImage(), style: .plain, target: self, action: #selector(onFavouritePressed))
        self.navigationItem.rightBarButtonItem = favButton
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "BannerItemCell", bundle: nil),
            forCellReuseIdentifier: "BannerItemCell"
        )
        tableView.register(
            UINib(nibName: "InfoItemCell", bundle: nil),
            forCellReuseIdentifier: "InfoItemCell"
        )
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.bounces = true
        tableView.autoresizingMask = .flexibleHeight
        tableView.allowsSelection = false
    }
    
    func setData(data: FormulaOneTeam) {
        self.title = data.strTeam!
        self.team = data
        
        setFavourite(isFavourite: repo.isTeamInFavouritesList(id: data.idTeam!))
        
        items.append(BannerItem(
            teamBannerUrl: data.strTeamBanner,
            teamLogoUrl: data.strTeamLogo
        ))
        
        items.append(InfoItem(
            title: "Founded at",
            desc: data.intFormedYear!
        ))
        
        items.append(InfoItem(
            title: "About",
            desc: data.strDescriptionEN!
        ))
        
        items.append(InfoItem(
            title: "Headquarter",
            desc: data.getHeadquarter()
        ))
        
        items.append(InfoItem(
            title: "Teams Origin",
            desc: data.strCountry!
        ))
        
        tableView.reloadData()
    }
    
    private func getFavImage() -> UIImage? {
        return isFavourite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }

    @objc func onFavouritePressed() {
        let isFavourite = !self.isFavourite
        if (isFavourite) {
            if let team = team { repo.storeAsFavourite(team: team) }
        } else {
            if let idTeam = team?.idTeam { repo.deleteFromFavouritesList(id: idTeam) }
        }
        setFavourite(isFavourite: isFavourite)
    }
    
    private func setFavourite(isFavourite: Bool) {
        self.isFavourite = isFavourite
        self.navigationItem.rightBarButtonItem?.image = getFavImage()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item.type {
        case .bannerWithTeamName:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerItemCell", for: indexPath) as? BannerItemCell {
                cell.setData(data: item as! BannerItem)
                return cell
            }
        case .infoItem:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoItemCell", for: indexPath) as? InfoItemCell {
                cell.setData(data: item as! InfoItem)
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
}
