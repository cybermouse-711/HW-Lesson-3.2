//
//  TableViewCell.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 26.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var comandLabel: UILabel!
    
    private let spaseX = NetworkManager.shared
    
    func setupComandLabel(with crew: Crew) {
        
            comandLabel.text = "Crew member: \(crew.role)"
            comandLabel.text = "ID: \(crew.crew)"
    }
}
