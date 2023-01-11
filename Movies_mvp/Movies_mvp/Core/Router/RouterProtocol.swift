// RouterProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол роутера
protocol RouterProtocol: RouterMainProtocol {
    func movieCatalogViewController()
    func showMovieDetailViewController(id: Int)
}
