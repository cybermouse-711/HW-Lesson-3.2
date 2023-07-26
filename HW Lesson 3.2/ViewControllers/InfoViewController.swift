//
//  InfoViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

// MARK: - UIViewController
final class InfoViewController: UIViewController {
   
    // MARK: - @IBOutlet
    @IBOutlet var infoImageView: UIImageView!
    @IBOutlet var infoLabel: UILabel!  
    
    // MARK: - Singlton
    private let spaseX = NetworkManager.shared
    
    // MARK: - Override metods
    override func viewDidLoad() {
        fetchImage()
        fetchJSON()
        self.navigationController?.navigationBar.tintColor = UIColor.gray
    }
    
    // MARK: - Private metods
    private func fetchImage() {
        
        spaseX.fetchImage(for: Link.spaceXShatlImage.url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.infoImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}

// MARK: - Networking
extension InfoViewController {
    
    func fetchJSON() {
        spaseX.fetchJSON(SpaceX.self, for: Link.spaceXJSON.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.infoLabel.text = self?.setupInfoLabel(with: data)
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}
