// Router.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Роутер
final class Router: RouterProtocol {
    // MARK: - Public Properties

    var navigationController: UINavigationController?
    var builder: BuilderProtocol

    // MARK: - Initializers

    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }

    // MARK: - Public methods

    func movieCatalogViewController() {
        if let navigationController = navigationController {
            let movieCatalogViewController = builder.makeMovieCatalogViewController(router: self)
            navigationController.viewControllers = [movieCatalogViewController]
        }
    }

    func showMovieDetailViewController(id: Int) {
        if let navigationController = navigationController {
            let movieDetailViewController = builder.makeMovieDetailViewController(id: id, router: self)
            navigationController.pushViewController(movieDetailViewController, animated: true)
        }
    }
}
