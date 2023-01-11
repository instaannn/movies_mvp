// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import SwiftyJSON

/// Протокол для сетевого слоя
protocol NetworkServiceProtocol {
    func fetchMovieDetails(for id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
    func fetchTrailer(for id: Int, completion: @escaping (Result<[Video], Error>) -> Void)
    func fetchCast(for id: Int, completion: @escaping (Result<[Actor], Error>) -> Void)
    func fetchMovies(page: Int, requestType: RequestType, completion: @escaping (Result<[Movie], Error>) -> Void)
}
