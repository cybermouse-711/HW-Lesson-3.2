//
//  ViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 19.07.2023.
//

import UIKit

enum Link: String {
    case spaceXJSON = "https://api.spacexdata.com/v5/launches/latest"
    case spaseXComandImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/SpaceX_Crew-5_Official_Portrait.jpg/600px-SpaceX_Crew-5_Official_Portrait.jpg"
    case spaceXCrew5Image = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/NASA’s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg/600px-NASA’s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg"
    case spaceXShatlImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg/810px-SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSpaceX()
    }
}

extension ViewController {
    
    private func fetchSpaceX() {
        guard let url = URL(string: Link.spaceXJSON.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
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
