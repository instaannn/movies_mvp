// MovieCatalogPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер каталога фильмов
final class MovieCatalogPresenter: MovieCatalogPresenterProtocol {
    // MARK: - Public Properties

    weak var view: MovieCatalogViewProtocol?
    var router: RouterProtocol?
    var movies: [Movie] = []

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private var hasNextPage = true
    private var currentPage = 1
    private var currentRequestType: RequestType = .popular

    // MARK: - Initializers

    init(view: MovieCatalogViewProtocol?, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }

    // MARK: - Public methods

    func fetchMovies(requestType: RequestType) {
        networkService.fetchMovies(page: currentPage, requestType: requestType, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.movies += data
                self.hasNextPage = true
                self.view?.succes()
            case let .failure(error):
                self.view?.failure(error)
            }
        })
    }

    func updateNextPage() {
        if hasNextPage {
            currentPage += 1
            fetchMovies(requestType: currentRequestType)
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
            fetchMovies(requestType: currentRequestType)
        case 1:
            updateForSegment()
            currentRequestType = .topRated
            fetchMovies(requestType: currentRequestType)
        case 2:
            updateForSegment()
            currentRequestType = .upcoming
            fetchMovies(requestType: currentRequestType)
        default:
            break
        }
    }

    func selectMovie(id: Int) {
        router?.showMovieDetailViewController(id: id)
    }
}
