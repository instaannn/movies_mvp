// MockNetworkService.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import SwiftyJSON
import UIKit

// Мок сетевого сервиса
final class MockNetworkService: NetworkServiceProtocol {
    // MARK: - Constants

    private enum Constants {
        static let mockMovieDetailName = "MockMovieDetail"
        static let mockVideosName = "MockVideos"
        static let mockActorsName = "MockActors"
        static let mockMovieName = "MockMovie"
        static let resultsName = "results"
        static let castName = "cast"
        static let emptyText = ""
        static let jsonName = "json"
        static let errorName = "error"
    }

    // MARK: - Private Properties

    private var movies: [Movie]?
    private var movieDetail: MovieDetail?
    private var videos: [Video]?
    private var actors: [Actor]?
    private var json = JSON()

    // MARK: - Initializers

    init() {}

    convenience init(movies: [Movie]?) {
        self.init()
        self.movies = movies
    }

    convenience init(movieDetail: MovieDetail?) {
        self.init()
        self.movieDetail = movieDetail
    }

    convenience init(videos: [Video]?) {
        self.init()
        self.videos = videos
    }

    convenience init(actors: [Actor]?) {
        self.init()
        self.actors = actors
    }

    // MARK: - Public methods

    func fetchMovieDetails(for id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        if var movieDetail = movieDetail {
            let json = getData(name: Constants.mockMovieDetailName)
            let movieJSON = MovieDetail(json: json)
            movieDetail = movieJSON
            completion(.success(movieDetail))
        } else {
            let error = NSError(domain: Constants.emptyText, code: 0)
            completion(.failure(error))
        }
    }

    func fetchTrailer(for id: Int, completion: @escaping (Result<[Video], Error>) -> Void) {
        if var videos = videos {
            let json = getData(name: Constants.mockVideosName)
            let movieJSON = json[Constants.resultsName].arrayValue.map { Video(json: $0) }
            videos = movieJSON
            completion(.success(videos))
        } else {
            let error = NSError(domain: Constants.emptyText, code: 0)
            completion(.failure(error))
        }
    }

    func fetchCast(for id: Int, completion: @escaping (Result<[Actor], Error>) -> Void) {
        if var actors = actors {
            let json = getData(name: Constants.mockActorsName)
            let movieJSON = json[Constants.castName].arrayValue.map { Actor(json: $0) }
            actors = movieJSON
            completion(.success(actors))
        } else {
            let error = NSError(domain: Constants.emptyText, code: 0)
            completion(.failure(error))
        }
    }

    func fetchMovies(
        page: Int,
        requestType: RequestType,
        completion: @escaping (
            Result<[Movie], Error>
        ) -> Void
    ) {
        if var movies = movies {
            let json = getData(name: Constants.mockMovieName)
            let movieJSON = json[Constants.resultsName].arrayValue.map { Movie(json: $0) }
            movies = movieJSON
            completion(.success(movies))
        } else {
            let error = NSError(domain: Constants.emptyText, code: 0)
            completion(.failure(error))
        }
    }

    // MARK: - Private Methods

    private func getData(name: String, withExtension: String = Constants.jsonName) -> JSON {
        guard let jsonURL = Bundle.main.path(forResource: name, ofType: withExtension)
        else { return JSON() }
        do {
            let fileURL = URL(fileURLWithPath: jsonURL)
            let data = try Data(contentsOf: fileURL)
            let json = try JSON(data: data)
            return json
        } catch {
            print(Constants.errorName)
        }
        return JSON()
    }
}
