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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Singlton
    private let spaseX = NetworkManager.shared
    
    // MARK: - Override metods
    override func viewDidLoad() {
        fetchImage()
        fetchJSON()
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - Private metods
    private func fetchImage() {
        spaseX.fetchImage(for: Link.spaceXShatlImage) { [weak self] result in
            switch result {
            case .success(let image):
                self?.infoImageView.image = UIImage(data: image)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
                self?.showAlert()
            }
        }
    }
}

// MARK: - Extensions for UILabel
extension UIViewController {
    
    func setupInfoLabel(with spaceX: SpaceX) -> String {
        var label = ""
        
        label = """
Name: \(spaceX.name)
    Date UTC: \(spaceX.dateUtc)
    Data LOCAL: \(spaceX.dateLocal)


Link:
        Webcast: \(spaceX.links.webcast)
        Youtub:   \(spaceX.links.youtubeId)
        Wikipedia:   \(spaceX.links.wikipedia)
"""
        return label
    }
}

// MARK: - Networking
extension InfoViewController {
    func fetchJSON() {
        spaseX.fetchJSON(for: Link.spaceXJSON) { [weak self] result in
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

