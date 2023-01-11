// BuilderProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол билдера
protocol BuilderProtocol {
    func makeMovieCatalogViewController(router: RouterProtocol) -> MovieCatalogViewController
    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> MovieDetailViewController
}
