// RouterProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол роутера
protocol RouterProtocol: RouterMain {
    func movieCatalogViewController()
    func showMovieDetailViewController(id: Int)
}
