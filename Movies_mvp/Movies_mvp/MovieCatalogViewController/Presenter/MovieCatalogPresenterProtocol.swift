// MovieCatalogPresenterProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол презентера каталога фильмов
protocol MovieCatalogPresenterProtocol {
    var movies: [Movie] { get set }

    func fetchMovies(requestType: RequestType)
    func updateNextPage()
    func segmentControlUpdate(index: Int)
    func updateForSegment()
    func selectMovie(id: Int)
}
