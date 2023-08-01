//
//  ComandViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

// MARK: - Protocol
protocol AddMemberViewControllerDelegate: AnyObject {
    func getCrew(_ object: Crew)
}

// MARK: - UIViewController
final class ComandViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet var comandImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Singlton
    private let spaceX = NetworkManager.shared

    // MARK: - Property
    var crew: [Crew] = []
    
    // MARK: - Override metods
    override func viewDidLoad() {
        fetchImage()
        fetchJSON()
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        tableView.dataSource = self
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let memberVC = segue.destination as? AddMemberViewController else { return }
        memberVC.delegate = self
    }
    
    // MARK: - Private metods
    private func fetchImage() {
        spaceX.fetchImage(for: Link.spaseXComandImage) { [weak self] result in
            switch result {
            case .success(let image):
                self?.comandImageView.image = UIImage(data: image)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}

// MARK: - Networking
extension ComandViewController {
    func fetchJSON() {
        spaceX.fetchJSON(for: Link.spaceXJSON) { [weak self] result in
            switch result {
            case .success(let data):
                self?.crew = data.crew
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}

// MARK: - UITableViewDataSourse
extension ComandViewController: UITableViewDataSource {
    
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


// MARK: - AddMemberViewControllerDelegate
extension ComandViewController: AddMemberViewControllerDelegate {
    func getCrew(_ object: Crew) {
        crew.append(object)
        tableView.reloadData()
    }
}
