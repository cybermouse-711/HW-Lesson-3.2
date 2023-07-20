//
//  Model.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 20.07.2023.
//

import Foundation

struct SpaceX: Decodable {
    let links: Links?
    let static_fire_date_utc: String?
    let static_fire_date_unix: String?
    let net: Bool?
    let window: String?
    let rocket: String?
    let success: Bool?
    let failures: [Int]?
    let details: String?
}

struct Links: Decodable {
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit: String?
    let webcast: String?
    let youtube_id: String?
    let article: String?
    let wikipedia: String?
}

struct Patch: Decodable {
    let small: String?
    let large: String?
}

struct Reddit: Decodable {
    let campaign: String?
    let launch: String?
    let media: String?
    let recovery: String?
}

struct Flickr: Decodable {
    let small: [Int]?
    let original: [Int]?
}
