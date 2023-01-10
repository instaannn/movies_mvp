// BuilderProtocol.swift
// Copyright © RoadMap. All rights reserved.

protocol BuilderProtocol {
    func makeMovieCatalogViewController(router: RouterProtocol) -> MovieCatalogViewController
    func makeMovieDetailViewController(id: Int, router: RouterProtocol) -> MovieDetailViewController
}
