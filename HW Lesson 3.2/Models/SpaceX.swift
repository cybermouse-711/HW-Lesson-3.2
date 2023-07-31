//
//  Model.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 20.07.2023.
//

import Foundation

// MARK: - Models
struct SpaceX: Decodable {
    let links: Links
    var crew: [Crew]
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
        let linksDictionary = courseData["links"] as? [String: Any] ?? [:]
        links = Links(courseData: linksDictionary)
        let crewDictionary = courseData["crew"] as? [[String: Any]] ?? [[:]]
        crew = Crew.getCrew(crewDictionary)
        flightNumber = courseData["flight_number"] as? Int ?? 0
        name = courseData["name"] as? String ?? ""
        dateUtc = courseData["date_utc"] as? String ?? ""
        dateLocal = courseData["date_local"] as? String ?? ""
    }
    
    static func getSpaceX(_ value: Any) -> SpaceX {
        let courseData = value as? [String: Any] ?? [:]
        let spaceX = SpaceX(courseData: courseData)
        return spaceX
    }
}

struct Links: Decodable {
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
        let patchDictionary = courseData["patch"] as? [String: Any] ?? [:]
        patch = Patch(courseData: patchDictionary)
        let redditDictionary = courseData["reddit"] as? [String: Any] ?? [:]
        reddit = Reddit(courseData: redditDictionary)
        webcast = courseData["webcast"] as? String ?? ""
        youtubeId = courseData["youtube_id"] as? String ?? ""
        wikipedia = courseData["wikipedia"] as? String ?? ""
    }
    
    // static func getLinks(_ value: Any) -> [Links] {
   //     guard let courseData = value as? [[String: Any]] else {return []}
    //    return courseData.map { Links(courseData: $0) }
   // }
}

struct Patch: Decodable {
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

 //   static func getPatch(_ value: Any) -> [Patch] {
  //      guard let courseData = value as? [[String: Any]] else {return []}
 //       return courseData.map { Patch(courseData: $0) }
  //  }
}

struct Reddit: Decodable {
    let launch: String
    
    init(launch: String) {
        self.launch = launch
    }
    
    init(courseData: [String: Any]) {
        launch = courseData["launch"] as? String ?? ""
    }
    
  //  static func getReddit(_ value: Any) -> [Reddit] {
   //     guard let courseData = value as? [[String: Any]] else {return []}
  //      return courseData.map { Reddit(courseData: $0) }
  //  }
}

struct Crew: Decodable {
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

    static func getCrew(_ value: [[String: Any]]) -> [Crew] {
        value.map { Crew(courseData: $0) }
        
    }
}

