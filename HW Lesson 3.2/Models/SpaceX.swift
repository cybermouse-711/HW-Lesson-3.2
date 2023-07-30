//
//  Model.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 20.07.2023.
//

import Foundation

// MARK: - Models
struct SpaceX: Codable {
    let links: Links
    let crew: [Crew]
    let flightNumber: Int
    let name: String
    let dateUtc: String
    let dateLocal: String
    
    init(links: Links, crew: [Crew], flightNumber: Int, name: String, dateUtc: String, dateLocal: String) {
        self.links = links
        self.crew = crew
        self.flightNumber = flightNumber
        self.name = name
        self.dateUtc = dateUtc
        self.dateLocal = dateLocal
    }
    
    init(courseData: [String: Any]) {
        links = courseData["links"] as? Links ?? nil
        crew = courseData["crew"] as? [Crew] ?? []
        flightNumber = courseData["flight_number"] as? Int ?? 0
        name = courseData["name"] as? String ?? ""
        dateUtc = courseData["date_utc"] as? String ?? ""
        dateLocal = courseData["date_local"] as? String ?? ""
    }
    
    init(courseAdapter: AdapterSpaceX) {
        links = Links(
            patch: Patch(
                small: courseAdapter.links.patch.small,
                large: courseAdapter.links.patch.large
            ),
            reddit: Reddit(
                launch: courseAdapter.links.reddit.launch
            ),
            webcast: courseAdapter.links.webcast,
            youtubeId: courseAdapter.links.youtubeId,
            wikipedia: courseAdapter.links.wikipedia
        ) ?? nil
        crew = [Crew(
            crew: courseAdapter.crew.,
            role: courseAdapter.crew.
        ) ?? []
        flightNumber = Int(courseAdapter.flightNumber) ?? 0
        name = courseAdapter.name
        dateUtc = courseAdapter.dateUtc
        dateLocal = courseAdapter.dateLocal
    }
    
    static func getSpaceX(_ value: Any) -> [SpaceX] {
        guard let courseData = value as? [[String: Any]] else {return []}
        return courseData.map { SpaceX(courseData: $0) }
    }
}

struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let webcast: String
    let youtubeId: String
    let wikipedia: String
    
    init(patch: Patch, reddit: Reddit, webcast: String, youtubeId: String, wikipedia: String) {
        self.patch = patch
        self.reddit = reddit
        self.webcast = webcast
        self.youtubeId = youtubeId
        self.wikipedia = wikipedia
    }
    
    init(courseData: [String: Any]) {
        patch = courseData["patch"] as? Patch ?? nil
        reddit = courseData["reddit"] as? Reddit ?? nil
        webcast = courseData["webcast"] as? String ?? ""
        youtubeId = courseData["youtube_id"] as? String ?? ""
        wikipedia = courseData["wikipedia"] as? String ?? ""
    }
    
    init(courseAdapter: AdapterLinks) {
        patch = Patch(
            small: courseAdapter.patch.small,
            large: courseAdapter.patch.large
        )
        reddit = Reddit(
            launch: courseAdapter.reddit.launch
        )
        webcast = courseAdapter.webcast
        youtubeId = courseAdapter.youtubeId
        wikipedia = courseAdapter.wikipedia
    }
    
    static func getLinks(_ value: Any) -> [Links] {
        guard let courseData = value as? [[String: Any]] else {return []}
        return courseData.map { Links(courseData: $0) }
    }
}

struct Patch: Codable {
    let small: String
    let large: String
    
    init(small: String, large: String) {
        self.small = small
        self.large = large
    }
    
    init(courseData: [String: Any]) {
        small = courseData["small"] as? String ?? ""
        large = courseData["large"] as? String ?? ""
    }
    
    init(courseAdapter: AdapterPatch) {
        small = courseAdapter.small
        large = courseAdapter.large
    }
    
    static func getPatch(_ value: Any) -> [Patch] {
        guard let courseData = value as? [[String: Any]] else {return []}
        return courseData.map { Patch(courseData: $0) }
    }
}

struct Reddit: Codable {
    let launch: String
    
    init(launch: String) {
        self.launch = launch
    }
    
    init(courseData: [String: Any]) {
        launch = courseData["launch"] as? String ?? ""
    }
    
    init(courseAdapter: AdapterReddit) {
        launch = courseAdapter.launch
    }
    
    static func getReddit(_ value: Any) -> [Reddit] {
        guard let courseData = value as? [[String: Any]] else {return []}
        return courseData.map { Reddit(courseData: $0) }
    }
}

struct Crew: Codable {
    let crew: String
    let role: String
    
    init(crew: String, role: String) {
        self.crew = crew
        self.role = role
    }
    
    init(courseData: [String: Any]) {
        crew = courseData["crew"] as? String ?? ""
        role = courseData["role"] as? String ?? ""
    }
    
    init(courseAdapter: AdapterCrew) {
        crew = courseAdapter.crew
        role = courseAdapter.crew
    }
    
    static func getCrew(_ value: Any) -> [Crew] {
        guard let courseData = value as? [[String: Any]] else {return []}
        return courseData.map { Crew(courseData: $0) }
    }
}

// MARK: - Adapter Models
struct AdapterSpaceX: Decodable {
    let links: AdapterLinks
    let crew: [AdapterCrew]
    let flightNumber: String
    let name: String
    let dateUtc: String
    let dateLocal: String
}

struct AdapterLinks: Decodable {
    let patch: AdapterPatch
    let reddit: AdapterReddit
    let webcast: String
    let youtubeId: String
    let wikipedia: String
}

struct AdapterPatch: Decodable {
    let small: String
    let large: String
}

struct AdapterReddit: Decodable {
    let launch: String
}

struct AdapterCrew: Decodable {
    let crew: String
    let role: String
}
