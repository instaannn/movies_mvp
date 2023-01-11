// Movie.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель фильма
struct Movie {
    /// Название
    let title: String
    /// Постер
    let posterPath: String?
    /// Рейтинг
    let voteAverage: Double
    /// Дата релиза
    let releaseDateString: String
    /// id фильма
    let id: Int

    init(json: JSON) {
        title = json["title"].stringValue
        posterPath = json["poster_path"].string
        voteAverage = json["vote_average"].doubleValue
        releaseDateString = json["release_date"].stringValue
        id = json["id"].intValue
    }
}
