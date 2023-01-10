// Movie.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель фильма
struct Movie {
    let title: String
    let posterPath: String?
    let voteAverage: Double
    let releaseDateString: String
    let id: Int

    init(json: JSON) {
        title = json["title"].stringValue
        posterPath = json["poster_path"].string
        voteAverage = json["vote_average"].doubleValue
        releaseDateString = json["release_date"].stringValue
        id = json["id"].intValue
    }
}
