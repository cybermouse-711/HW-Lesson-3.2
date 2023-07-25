//
//  ComandViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import UIKit

final class ComandViewController: UIViewController {

    @IBOutlet var comandImageView: UIImageView!
    @IBOutlet var comandLabel: UILabel!
    
    private let spaseX = NetworkManager.shared
    
    override func viewDidLoad() {
        fetchImage()
        comandLabel.text = ""
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
