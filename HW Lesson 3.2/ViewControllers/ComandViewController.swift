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
    @IBOutlet var comandLabel: UILabel!
    
    private let spaseX = NetworkManager.shared
    
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
                self?.comandLabel.text = self?.setupComandLabel(with: data)
            case .failure(let error):
                print(error)
                self?.showAlert()
            }
        }
    }
}
