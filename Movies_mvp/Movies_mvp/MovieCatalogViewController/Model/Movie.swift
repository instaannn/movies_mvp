// Movie.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import SwiftyJSON

/// Модель фильма
final class Movie: Object {
    /// Название
    @Persisted var title: String
    /// Постер
    @Persisted var posterPath: String?
    /// Рейтинг
    @Persisted var voteAverage: Double
    /// Дата релиза
    @Persisted var releaseDateString: String
    /// Тип фильма
    @Persisted var movieType: String
    /// id фильма
    @Persisted(primaryKey: true) var id = 0

    convenience init(json: JSON) {
        self.init()
        title = json["title"].stringValue
        posterPath = json["poster_path"].string
        voteAverage = json["vote_average"].doubleValue
        releaseDateString = json["release_date"].stringValue
        id = json["id"].intValue
    }
}
