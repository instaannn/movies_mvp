// MockRouter.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import UIKit

// Мок роутера
final class MockRouter: RouterProtocol {
    // MARK: - Public Properties

    var builder: BuilderProtocol
    var navigationController: UINavigationController? = UINavigationController()
    var id = 0

    // MARK: - Initializers

    init(builder: BuilderProtocol) {
        self.builder = builder
    }

    // MARK: - Public Methods

    func movieCatalogViewController() {}

    func showMovieDetailViewController(id: Int) {}
}
