//
//  ExtensionVC.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 24.07.2023.
//

import UIKit

// MARK: - Extensions for Alert
extension UIViewController {
    func showAlert() {
        let alert = UIAlertController(title: "Oops!", message: "Data not received", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Close", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

