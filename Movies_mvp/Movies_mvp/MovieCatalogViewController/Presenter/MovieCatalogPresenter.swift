// MovieCatalogPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер каталога фильмов
final class MovieCatalogPresenter: MovieCatalogPresenterProtocol {
    // MARK: - Constants

    private enum Constants {
        static let key = "token"
    }

    // MARK: - Public Properties

    weak var view: MovieCatalogViewProtocol?
    var router: RouterProtocol?
    var movies: [Movie] = []

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private let realmService: RealmServiceProtocol
    private var hasNextPage = true
    private var currentPage = 1
    private var currentRequestType: RequestType = .popular

    // MARK: - Initializers

    init(
        view: MovieCatalogViewProtocol?,
        networkService: NetworkServiceProtocol,
        router: RouterProtocol,
        realmService: RealmServiceProtocol
    ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.realmService = realmService
        saveToken()
    }

    // MARK: - Public methods

    func loadMovies(requestType: RequestType) {
        guard let movies = realmService.getMovies(Movie.self, movieType: requestType.rawValue) else { return }
        if !movies.isEmpty {
            self.movies = Array(movies)
            view?.succes()
        } else {
            fetchMovies(requestType: requestType)
        }
    }

    func updateNextPage() {
        if hasNextPage {
            currentPage += 1
            loadMovies(requestType: currentRequestType)
            hasNextPage = false
        }
    }

    func updateForSegment() {
        movies.removeAll()
        currentPage = 1
    }

    func segmentControlUpdate(index: Int) {
        switch index {
        case 0:
            updateForSegment()
            currentRequestType = .popular
            loadMovies(requestType: currentRequestType)
        case 1:
            updateForSegment()
            currentRequestType = .topRated
            loadMovies(requestType: currentRequestType)
        case 2:
            updateForSegment()
            currentRequestType = .upcoming
            loadMovies(requestType: currentRequestType)
        default:
            break
        }
    }

    func selectMovie(id: Int) {
        router?.showMovieDetailViewController(id: id)
    }

    // MARK: - Private Methods

    private func fetchMovies(requestType: RequestType) {
        networkService.fetchMovies(page: currentPage, requestType: requestType, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                data.forEach { movie in
                    movie.movieType = requestType.rawValue
                }
                self.movies += data
                self.realmService.save(items: self.movies)
                self.hasNextPage = true
                self.view?.succes()
            case let .failure(error):
                self.view?.failure(error)
            }
        })
    }

    private func saveToken() {
        StorageService.shared.set(Constants.key)
    }
}
