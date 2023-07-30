//
//  NetworkMenager .swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 23.07.2023.
//

import Foundation
import Alamofire

// MARK: - Enum
enum Link {
    static let spaceXJSON = "https://api.spacexdata.com/v5/launches/latest"
    static let spaseXComandImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/SpaceX_Crew-5_Official_Portrait.jpg/600px-SpaceX_Crew-5_Official_Portrait.jpg"
    static let spaceXCrew5Image =  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/NASA%E2%80%99s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg/600px-NASA%E2%80%99s_SpaceX_Crew-5_Launch_%28NHQ202210050006%29.jpg"
    static let spaceXShatlImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg/810px-SpaceX_Dragon_Endurance_and_the_Earth%27s_horizon.jpg"
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
    
    func fetchJSON(for urlString: String, completion: @escaping(Result<[SpaceX], AFError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(url: "")))
            return
        }
        
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let data = SpaceX.getSpaceX(value)
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImage(for urlString: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(url: "")))
            return
        }
        
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let image):
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

