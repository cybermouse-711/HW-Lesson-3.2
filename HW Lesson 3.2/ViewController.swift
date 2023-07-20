//
//  ViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 19.07.2023.
//

import UIKit

enum Link: String {
    case spaceXURL = "https://api.spacexdata.com/v5/launches/latest"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSpaceX()
    }
}

extension ViewController {
    
    private func fetchSpaceX() {
        guard let url = URL(string: Link.spaceXURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "Not error")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let spaceX = try decoder.decode(SpaceX.self, from: data)
                print(spaceX)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
