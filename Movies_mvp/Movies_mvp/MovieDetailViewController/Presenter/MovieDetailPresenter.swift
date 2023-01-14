// MovieDetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

/// Презентер детального описания фильма
final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    // MARK: - Public Properties

    weak var view: MovieDetailViewProtocol?
    var router: RouterProtocol?
    var movieDetail: MovieDetail?
    var trailers: [Video] = []
    var actors: [Actor] = []

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private let realmService: RealmServiceProtocol
    private var movieId = 0

    // MARK: - Initializers

    init(
        view: MovieDetailViewProtocol?,
        networkService: NetworkServiceProtocol,
        id: Int,
        router: RouterProtocol,
        realmService: RealmServiceProtocol
    ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.realmService = realmService
        movieId = id
    }

    // MARK: - Public methods

    func loadMovieDetails() {
        guard let movieDetail = realmService.get(MovieDetail.self, id: movieId) else { return fetchMovieDetails() }
        self.movieDetail = movieDetail
        view?.setupUI(movieDetail: movieDetail)
    }

    func fetchTrailer() {
        networkService.fetchTrailer(for: movieId, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(videos):
                self.trailers = videos
            case let .failure(error):
                self.view?.failure(error)
            }
        })
    }

    func fetchCast() {
        networkService.fetchCast(for: movieId, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(actors):
                self.actors = actors
                self.view?.success()
            case let .failure(error):
                self.view?.failure(error)
            }
        })
    }

    // MARK: - Private methods

    private func fetchMovieDetails() {
        networkService.fetchMovieDetails(for: movieId, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movieDetail):
                self.movieDetail = movieDetail
                self.realmService.save(items: [movieDetail])
                self.view?.setupUI(movieDetail: movieDetail)
            case let .failure(error):
                self.view?.failure(error)
            }
        })
    }
}
