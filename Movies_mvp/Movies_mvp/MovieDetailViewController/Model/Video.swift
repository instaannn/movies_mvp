// Video.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель отдельного видео
struct Video {
    let key: String

    init(json: JSON) {
        key = json["key"].stringValue
    }
}
