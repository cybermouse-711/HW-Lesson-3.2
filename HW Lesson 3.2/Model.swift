//
//  Model.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 20.07.2023.
//

import Foundation

struct SpaceX: Decodable {
    let links: Links?
    let static_fire_date_utc: Any?
    let static_fire_date_unix: Any?
    let net: Bool?
    let window: String?
    let rocket: String?
    let success: Bool?
    let failures: [Any]?
    let details: Any?
}

struct Links: Decodable {
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit: Any?
    let webcast: String?
    let youtube_id: String?
    let article: Any?
    let wikipedia: String?
}

struct Patch: Decodable {
    let small: String?
    let large: String?
}

struct Reddit: Decodable {
    let campaign: Any?
    let launch: String?
    let media: Any?
    let recovery: Any?
}

struct Flickr: Decodable {
    let small: [Any]?
    let original: [Any]?
}
