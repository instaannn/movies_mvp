// MovieDetailPresenterProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол презентера детального описания фильма
protocol MovieDetailPresenterProtocol {
    var movieDetail: MovieDetail? { get set }
    var trailers: [Video] { get set }
    var actors: [Actor] { get set }

    func loadMovieDetails()
    func fetchTrailer()
    func fetchCast()
}
