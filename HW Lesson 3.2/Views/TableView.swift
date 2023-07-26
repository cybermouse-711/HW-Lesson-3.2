//
//  TableView.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 26.07.2023.
//

import UIKit

// MARK: - TableView
final class TableView: UITableView{
    
    // MARK: - Singlton
    private let spaseX = NetworkManager.shared
    
    // MARK: - Private property
    private var crew: [Crew] = []
    
    // MARK: - Networking
    func fetchJSON() {
        spaseX.fetchJSON(SpaceX.self, for: Link.spaceXJSON.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.crew = data.crew
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        crew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        let member = crew[indexPath.row]
        cell.setupComandLabel(with: member)
        return cell
    }
}
