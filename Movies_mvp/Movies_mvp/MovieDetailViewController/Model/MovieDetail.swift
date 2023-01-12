// MovieDetail.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import SwiftyJSON

/// Модель детального описания фильма
final class MovieDetail: Object {
    /// Фоновая каринка
    @Persisted var backdropPath: String
    /// Постер
    @Persisted var posterPath: String?
    /// Название
    @Persisted var title: String
    /// Время фильма
    @Persisted var runtime: Int?
    /// Рейтинг
    @Persisted var voteAverage: Double
    /// Ссылка на imdbId
    @Persisted var imdbId: String?
    /// Дата релиза
    @Persisted var releaseDateString: String
    /// Описание
    @Persisted var overview: String
    /// Id фильма
    @Persisted(primaryKey: true) var id = 0

    convenience init(json: JSON) {
        self.init()
        backdropPath = json["backdrop_path"].stringValue
        posterPath = json["poster_path"].string
        title = json["title"].stringValue
        runtime = json["runtime"].int
        voteAverage = json["vote_average"].doubleValue
        imdbId = json["imdb_id"].string
        releaseDateString = json["release_date"].stringValue
        overview = json["overview"].stringValue
        id = json["id"].intValue
    }
}
