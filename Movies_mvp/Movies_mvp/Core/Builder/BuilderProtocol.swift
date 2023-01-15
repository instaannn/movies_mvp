// BuilderProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдера
protocol BuilderProtocol {
    func makeMovieCatalogViewController(router: RouterProtocol) -> UIViewController
    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> UIViewController
}
