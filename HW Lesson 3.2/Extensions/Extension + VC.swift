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
    Wikipedia   \(spaceX.links.wikipedia)
"""
        return label
    }
}

// MARK: - Extensions for UITableView
extension UIViewController {
    
    func setupTableView(with spaceX: SpaceX) {} /* -> UITableView {
        var tableView: UITableView
        
        return tableView
    } */
}
