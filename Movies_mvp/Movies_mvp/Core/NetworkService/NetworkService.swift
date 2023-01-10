// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import SwiftyJSON

/// Вызовы сетевых запросов
final class NetworkService: NetworkCoreService, NetworkServiceProtocol {
    // MARK: - Constants

    private enum Constants {
        static let detailsUrlString = "?api_key=\(NetworkApi.token)&language=ru-RU"
        static let trailerUrlString = "/videos?api_key=\(NetworkApi.token)"
        static let castUrlString = "/credits?api_key=\(NetworkApi.token)"
    }

    // MARK: - Public methods

    func fetchResult(page: Int, requestType: RequestType, completion: @escaping (Result<[Movie], Error>) -> Void) {
        downloadJsonResult(page: page, requestType: requestType) { result in
            switch result {
            case let .success(json):
                let movies = json["results"].arrayValue.map { Movie(json: $0) }
                completion(.success(movies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchDetails(for id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        downloadJson(urlString: "\(NetworkApi.detailUrlString)\(id)\(Constants.detailsUrlString)") { result in
            switch result {
            case let .success(json):
                completion(.success(MovieDetail(json: json)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchTrailer(for id: Int, completion: @escaping (Result<[Video], Error>) -> Void) {
        downloadJson(urlString: "\(NetworkApi.detailUrlString)\(id)\(Constants.trailerUrlString)") { result in
            switch result {
            case let .success(json):
                let videos = json["results"].arrayValue.map { Video(json: $0) }
                completion(.success(videos))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchCast(for id: Int, completion: @escaping (Result<[Actor], Error>) -> Void) {
        downloadJson(urlString: "\(NetworkApi.detailUrlString)\(id)\(Constants.castUrlString)") { result in
            switch result {
            case let .success(json):
                let actors = json["cast"].arrayValue.map { Actor(json: $0) }
                completion(.success(actors))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
