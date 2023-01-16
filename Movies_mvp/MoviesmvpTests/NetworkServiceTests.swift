// NetworkServiceTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import XCTest

/// Тестирование сетевого сервиса
final class NetworkServiceTests: XCTestCase {
    // MARK: - Private Properties

    private var networkService: NetworkServiceProtocol?
    private var movies: [Movie]?
    private var actors: [Actor]?
    private var videos: [Video]?
    private var movieDetail: MovieDetail?

    // MARK: - Public Methods

    override func setUp() {
        networkService = MockNetworkService()
    }

    override func tearDown() {
        networkService = nil
        movies = nil
        actors = nil
        videos = nil
        movieDetail = nil
    }

    func testFetchMoviesSuccess() {
        movies = [Movie]()
        var catchMovies: [Movie] = []

        networkService = MockNetworkService(movies: movies)

        networkService?.fetchMovies(page: 0, requestType: .topRated, completion: { result in
            switch result {
            case let .success(movies):
                catchMovies = movies
            case let .failure(error):
                print(error)
            }
        })
        XCTAssertEqual(catchMovies.count, 20)
    }

    func testFetchCastSuccess() {
        actors = [Actor]()
        var catchActors: [Actor] = []

        networkService = MockNetworkService(actors: actors)

        networkService?.fetchCast(for: 0, completion: { result in
            switch result {
            case let .success(actors):
                catchActors = actors
            case let .failure(error):
                print(error)
            }
        })
        XCTAssertEqual(catchActors.count, 5)
    }

    func testFetchTrailerSuccess() {
        videos = [Video]()
        var catchVideos: [Video] = []

        networkService = MockNetworkService(videos: videos)

        networkService?.fetchTrailer(for: 0, completion: { result in
            switch result {
            case let .success(actors):
                catchVideos = actors
            case let .failure(error):
                print(error)
            }
        })
        XCTAssertEqual(catchVideos.count, 20)
    }

    func testFetchMovieDetailSuccess() {
        movieDetail = MovieDetail()
        var catchMovieDetail: MovieDetail?

        networkService = MockNetworkService(movieDetail: movieDetail)

        networkService?.fetchMovieDetails(for: 0, completion: { result in
            switch result {
            case let .success(movie):
                catchMovieDetail = movie
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
        XCTAssertNotNil(catchMovieDetail)
    }
}
