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
    var selectedTeam: FormulaOneTeam? = nil
    let repo = FormulaTeamRepository()
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavigationBar()
        self.hidesBottomBarWhenPushed = true
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
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
        tableView.register(
            UINib(nibName: "ImageSliderCell", bundle: nil),
            forCellReuseIdentifier: "ImageSliderCell"
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
        selectedTeam = FormulaOneTeam(value: data)
        
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
        
        let gallery = data.getFanart()
        if gallery.count > 0 {
            items.append(ImageSlider(
                title: "Gallery",
                imagesUrl: gallery,
                onImageClick: { (idx) in
                    self.showImagePopup(url: gallery[idx])
                }
            ))
        }
        
        tableView.reloadData()
    }
    
    private func getFavImage() -> UIImage? {
        return isFavourite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }

    @objc func onFavouritePressed() {
        let isFavourite = !self.isFavourite
        
        guard let team = selectedTeam else { return }
        
        if (isFavourite) {
            repo.storeAsFavourite(team: FormulaOneTeam(value: team))
            alert.message = "\(team.strTeam!) is added to favourites list"
        } else {
            let teamName = team.strTeam!
            repo.deleteFromFavouritesList(id: team.idTeam!)
            alert.message = "\(teamName) is removed from favourites list"
        }
        
        setFavourite(isFavourite: isFavourite)
        
        self.present(alert, animated: true)
    }
    
    private func setFavourite(isFavourite: Bool) {
        self.isFavourite = isFavourite
        self.navigationItem.rightBarButtonItem?.image = getFavImage()
    }
    
    private func showImagePopup(url rawUrl: String) {
        //https://stackoverflow.com/questions/34694377/swift-how-can-i-make-an-image-full-screen-when-clicked-and-then-original-size
        guard let url = URL(string: rawUrl) else { return }
        
        let imageView = UIImageView()
        imageView.fromUrl(from: url)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissImagePopup))
        imageView.addGestureRecognizer(tap)
        
        
        self.navigationController?.view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func dismissImagePopup(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        sender.view?.removeFromSuperview()
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
        case .imageSlider:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSliderCell", for: indexPath) as? ImageSliderCell {
                cell.setData(data: item as! ImageSlider)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
