// Actor.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель информации об актере
struct Actor {
    /// Имя актера
    let name: String
    /// Постер
    let profilePath: String?

    init(json: JSON) {
        name = json["name"].stringValue
        profilePath = json["profile_path"].string
    }
}
