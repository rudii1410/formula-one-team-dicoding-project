//
//  ViewController.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 14/06/21.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let FORMULA_ONE_TEAM_CELL_ID = "formula_one_team_cell"
    var formulaOneTeams: [FormulaOneTeam] = []
    @IBOutlet private weak var teamsTableView: UITableView!
    private let progressHUD = ProgressHUD(text: "Loading data")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(progressHUD)
        showLoadingDialog()
        
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
        teamsTableView.register(
            UINib(nibName: "TeamCell", bundle: nil),
            forCellReuseIdentifier: FORMULA_ONE_TEAM_CELL_ID
        )
        
        loadFormulaOneTeam()
    }
    
    private func loadFormulaOneTeam() {
        let service = FormulaTeamRepository()
        service.fetchTeamList { (result) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let response):
                    if let teams = response.teams {
                        self?.formulaOneTeams = teams
                    }
                    self?.teamsTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                self?.hideLoadingDialog()
            }
        }
    }
    
    private func showLoadingDialog() {
        progressHUD.show()
    }
    
    private func hideLoadingDialog() {
        progressHUD.hide()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulaOneTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = teamsTableView.dequeueReusableCell(withIdentifier: FORMULA_ONE_TEAM_CELL_ID, for: indexPath) as? TeamCell {
            let data = self.formulaOneTeams[indexPath.row]
            cell.setData(teamImage: URL(string: data.strTeamLogo!)!, teamName: data.strTeam!, teamOrigin: data.strCountry!)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = TeamDetailVC(nibName: "TeamDetailVC", bundle: nil)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

