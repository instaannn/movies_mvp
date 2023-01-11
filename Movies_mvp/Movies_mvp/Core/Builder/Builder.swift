// Builder.swift
// Copyright © RoadMap. All rights reserved.

/// Билдер
final class Builder: BuilderProtocol {
    // MARK: - Public methods

    func makeMovieCatalogViewController(router: RouterProtocol) -> MovieCatalogViewController {
        let viewController = MovieCatalogViewController()
        let networkService = NetworkService()
        let presenter = MovieCatalogPresenter(view: viewController, networkService: networkService, router: router)
        viewController.presenter = presenter
        return viewController
    }

    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let networkService = NetworkService()
        let presenter = MovieDetailPresenter(
            view: viewController,
            networkService: networkService,
            id: id,
            router: router
        )
        viewController.presenter = presenter
        return viewController
    }
}
