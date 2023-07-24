//
//  ExtensionVC.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 24.07.2023.
//

import UIKit

extension ViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: "Oops!", message: "Data not received", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Close", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
