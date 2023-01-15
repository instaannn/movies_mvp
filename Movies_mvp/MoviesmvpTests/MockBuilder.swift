// MockBuilder.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import UIKit

/// Мок билдера
final class MockBuilder: BuilderProtocol {
    // MARK: - Public Methods

    func makeMovieCatalogViewController(router: RouterProtocol) -> UIViewController {
        UIViewController()
    }

    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> UIViewController {
        UIViewController()
    }
}
