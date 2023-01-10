// MovieDetail.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Модель детального описания фильма
struct MovieDetail {
    let backdropPath: String
    let posterPath: String?
    let title: String
    let runtime: Int?
    let voteAverage: Double
    let imdbId: String?
    let releaseDateString: String
    let genres: [String]
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
