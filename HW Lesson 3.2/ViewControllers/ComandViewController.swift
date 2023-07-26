//
//  ComandViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

// MARK: - UIViewController
final class ComandViewController: UIViewController {

    @IBOutlet var comandImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    private let spaseX = NetworkManager.shared
    private var crew: [Crew] = []
    
    
    override func viewDidLoad() {
        fetchImage()
        fetchJSON()
        
        
    }
    
    private func fetchImage() {
        spaseX.fetchImage(for: Link.spaseXComandImage.url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.comandImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error)
                self?.showAlert()
            }
        }
    }
}

// MARK: - Networking
extension ComandViewController {
    
    func fetchJSON() {
        spaseX.fetchJSON(SpaceX.self, for: Link.spaceXJSON.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.crew = data.crew
            case .failure(let error):
                print(error)
                self?.showAlert()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ComandViewController {
    
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
