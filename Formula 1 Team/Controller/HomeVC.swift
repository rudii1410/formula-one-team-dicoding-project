//
//  ViewController.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 14/06/21.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource {
    
    private let FORMULA_ONE_TEAM_CELL_ID = "formula_one_team_cell"
    var formulaOneTeams: [String] = ["a", "b"]
    @IBOutlet private weak var teamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFormulaOneTeam()
        
        teamsTableView.dataSource = self
        teamsTableView.register(
            UINib(nibName: "TeamCell", bundle: nil),
            forCellReuseIdentifier: FORMULA_ONE_TEAM_CELL_ID
        )
    }
    
    private func loadFormulaOneTeam() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulaOneTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = teamsTableView.dequeueReusableCell(withIdentifier: FORMULA_ONE_TEAM_CELL_ID, for: indexPath) as? TeamCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

