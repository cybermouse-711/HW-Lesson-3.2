//
//  TableViewCell.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 26.07.2023.
//

import UIKit

// MARK: - TableViewCell
final class TableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet var comandLabel: UILabel!
    
    // MARK: - Metods
    func setupComandLabel(with crew: Crew) {
        
            comandLabel.text = "Crew member: \(crew.role)"
            comandLabel.text = "ID: \(crew.crew)"
    }
}
