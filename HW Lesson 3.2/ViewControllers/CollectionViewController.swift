//
//  CollectionViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 24.07.2023.
//

import UIKit

// MARK: - Enum
enum Name: CaseIterable {
    case launch
    case info
    case comand
    
    var name: String {
        switch self {
        case .launch:
            return "Launch"
        case .info:
            return "Info"
        case .comand:
            return "Comand"
        }
    }
}

// MARK: - CollectionViewController
final class CollectionViewController: UICollectionViewController {
    
    private let spaseX = NetworkManager.shared
    private let name = Name.allCases
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLauch" {
            guard let launchVC = segue.destination as? LaunchViewController else { return }
            //launchVC.
        } else if segue.identifier == "showInfo" {
            guard let infohVC = segue.destination as? InfoViewController else { return }
            //infoVC.
        } else if segue.identifier == "showComand" {
            guard let comandhVC = segue.destination as? ComandViewController else { return }
            //comandVC.
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        name.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "action", for: indexPath)
        guard let cell = cell as? ActionCell else { return UICollectionViewCell() }
        cell.actionLabel.text = name[indexPath.item].name
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = name[indexPath.item]
        
        switch action {
        case .launch:
            performSegue(withIdentifier: "showLauch", sender: nil)
        case .info:
            performSegue(withIdentifier: "showInfo", sender: nil)
        case .comand:
            performSegue(withIdentifier: "showComand", sender: nil)
        }
    }
}

// MARK: - Extension
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width)
    }
}
