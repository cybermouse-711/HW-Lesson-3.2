//
//  LaunchViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

final class LaunchViewController: UIViewController {

    @IBOutlet var launchImageView: UIImageView!
    
    private let spaseX = NetworkManager.shared
    
    override func viewDidLoad() {
        fetchImage()
    }
    
    private func fetchImage() {
        spaseX.fetchImage(for: Link.spaceXCrew5Image.url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.launchImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error)
                self?.showAlert()
            }
        }
    }
}
