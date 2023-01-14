// Builder.swift
// Copyright © RoadMap. All rights reserved.

/// Билдер
final class Builder: BuilderProtocol {
    // MARK: - Public methods

    func makeMovieCatalogViewController(router: RouterProtocol) -> MovieCatalogViewController {
        let viewController = MovieCatalogViewController()
        let storageService = StorageService()
        let networkService = NetworkService(keychainService: storageService)
        let realmService = RealmService()
        let presenter = MovieCatalogPresenter(
            view: viewController,
            networkService: networkService,
            router: router,
            realmService: realmService,
            storageService: storageService
        )
        viewController.presenter = presenter
        return viewController
    }

    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let storageService = StorageService()
        let networkService = NetworkService(keychainService: storageService)
        let realmService = RealmService()
        let presenter = MovieDetailPresenter(
            view: viewController,
            networkService: networkService,
            id: id,
            router: router,
            realmService: realmService
        )
        viewController.presenter = presenter
        return viewController
    }
}
