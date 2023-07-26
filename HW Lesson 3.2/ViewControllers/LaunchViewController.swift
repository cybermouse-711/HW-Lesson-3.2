//
//  LaunchViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

// MARK: - UIViewController
final class LaunchViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet var launchImageView: UIImageView!
    
    // MARK: - Singlton
    private let spaseX = NetworkManager.shared
    
    // MARK: - Override metods
    override func viewDidLoad() {
        fetchImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - Private metods
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
