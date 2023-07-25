//
//  NetworkMenager .swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import Foundation

// MARK: - Enum
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

// MARK: - Singlton
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchJSON<T: Decodable>(_ type: T.Type, for url: URL, complition: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                complition(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let spaceX = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(spaceX))
                }
            } catch _ {
                complition(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(for url: URL, complition: @escaping(Result<Data, NetworkError>) -> Void) {
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else {
                complition(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                complition(.success(image))
            }
        }
    }
}

