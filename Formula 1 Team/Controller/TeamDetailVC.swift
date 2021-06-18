//
//  TeamDetailVC.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import UIKit

class TeamDetailVC: UITableViewController {

    var items: [TeamDetailItem] = []
    var isFavourite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupTable()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = "Ferari team lalala yeyeye"
        
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
        tableView.isUserInteractionEnabled = false
    }
    
    func setData() {
        items.append(BannerItem(
            teamBannerUrl: "https://www.formula1.com/content/dam/fom-website/manual/Misc/2021-Master-Folder/F1%202021%20LAUNCH%20RENDERING%20(2).jpg",
            teamLogoUrl: "https://e7.pngegg.com/pngimages/710/189/png-clipart-scuderia-ferrari-ferrari-s-p-a-car-%E3%82%B9%E3%82%AF%E3%83%BC%E3%83%87%E3%83%AA%E3%82%A2-formula-1-car-emblem-logo.png",
            teamName: "Ferari team lalala yeyeye"
        ))
        items.append(InfoItem(
            title: "About",
            desc: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        ))
        
        items.append(InfoItem(
            title: "About",
            desc: "Sed ut per"
        ))
    }
    
    private func getFavImage() -> UIImage? {
        return isFavourite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }

    @objc func onFavouritePressed() {
        print("fav image")
        isFavourite = !isFavourite
        print(isFavourite)
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
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
}
