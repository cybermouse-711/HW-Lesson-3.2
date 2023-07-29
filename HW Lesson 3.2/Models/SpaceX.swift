//
//  Model.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 20.07.2023.
//

import Foundation
import Alamofire

// MARK: - Models
struct SpaceX: Decodable {
    let links: Links
    let crew: [Crew]
    let flightNumber: Int
    let name: String
    let dateUtc: String
    let dateLocal: String
}

struct Links: Decodable {
    let patch: Patch
    let reddit: Reddit
    let webcast: String
    let youtubeId: String
    let wikipedia: String
}

struct Patch: Decodable {
    let small: String
    let large: String
}

struct Reddit: Decodable {
    let launch: String
}

struct Crew: Decodable {
    let crew: String
    let role: String
}

// MARK: - Private extensions
private extension Crew {
    enum CodingKeys: String, CodingKey {
        case crew = "crew"
        case role = "role"
    }
}

private extension Reddit {
    enum CodingKeys: String, CodingKey {
        case launch = "launch"
    }
}

private extension Patch {
    enum CodingKeys: String, CodingKey {
        case small = "small"
        case large = "large"
    }
}

private extension Links {
    enum CodingKeys: String, CodingKey {
        case patch = "patch"
        case reddit = "reddit"
        case webcast = "webcast"
        case youtubeId = "youtube_id"
        case wikipedia = "wikipedia"
    }
}

private extension SpaceX {
    enum CodingKeys: String, CodingKey {
        case links = "links"
        case crew = "crew"
        case flightNumber = "flight_number"
        case name = "name"
        case dateUtc = "date_utc"
        case dateLocal = "date_local"
    }
}

