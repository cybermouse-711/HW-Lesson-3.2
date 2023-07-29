//
//  ComandViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

// MARK: - Protocol
protocol UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

// MARK: - UIViewController
final class ComandViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet var comandImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    
    // MARK: - Singlton
    private let spaseX = NetworkManager.shared

    // MARK: - Private Property
    private var crew: [Crew] = []
    
    // MARK: - Override metods
    override func viewDidLoad() {
        fetchImage()
      //  fetchJSON()
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        
       // tableView(tableView, cellForRowAt: <#T##IndexPath#>)
        //tableView(tableView, numberOfRowsInSection: <#T##Int#>)
    }
    
    // MARK: - Private metods
    private func fetchImage() {
        spaseX.fetchImage(for: Link.spaseXComandImage) { [weak self] result in
            switch result {
            case .success(let image):
                self?.comandImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}

/*
// MARK: - Networking
extension ComandViewController {
    
    func fetchJSON() {
        spaseX.fetchJSON(SpaceX.self, for: Link.spaceXJSON.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.tableView = self?.setupTableView(with: data)
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}
*/

// MARK: - UITableViewDelegate
extension ComandViewController: UITableViewDelegate {
    
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

