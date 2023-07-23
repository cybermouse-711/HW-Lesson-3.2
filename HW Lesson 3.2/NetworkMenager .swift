//
//  NetworkMenager .swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import Foundation

enum Link {
    case spaceXJSON
    case spaseXComandImage
    case spaceXCrew5Image
    case spaceXShatlImage
    
    var url: URL {
        switch self {
        case .spaceXJSON:
            return URL(string: "https://api.spacexdata.com/v5/launches/latest")!
        case .spaseXComandImage:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/SpaceX_Crew-5_Official_Portrait.jpg/600px-SpaceX_Crew-5_Official_Portrait.jpg")!
        case .spaceXCrew5Image:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/NASA’s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg/600px-NASA’s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg")!
        case .spaceXShatlImage:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg/810px-SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
}
