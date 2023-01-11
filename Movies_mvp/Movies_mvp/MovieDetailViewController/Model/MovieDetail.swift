// MovieDetail.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель детального описания фильма
struct MovieDetail {
    /// Фоновая каринка
    let backdropPath: String
    /// Постер
    let posterPath: String?
    /// Название
    let title: String
    /// Время фильма
    let runtime: Int?
    /// Рейтинг
    let voteAverage: Double
    /// Ссылка на imdbId
    let imdbId: String?
    /// Дата релиза
    let releaseDateString: String
    /// Жанры
    let genres: [String]
    /// Описание
    let overview: String

    init(json: JSON) {
        backdropPath = json["backdrop_path"].stringValue
        posterPath = json["poster_path"].string
        title = json["title"].stringValue
        runtime = json["runtime"].int
        voteAverage = json["vote_average"].doubleValue
        imdbId = json["imdb_id"].string
        releaseDateString = json["release_date"].stringValue
        genres = json["genres"].arrayValue.map { $0["name"].stringValue }
        overview = json["overview"].stringValue
    }
}
