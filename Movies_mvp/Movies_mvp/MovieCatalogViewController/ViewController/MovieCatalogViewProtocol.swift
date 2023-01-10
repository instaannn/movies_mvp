// MovieCatalogViewProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол каталога фильмов
protocol MovieCatalogViewProtocol: AnyObject {
    func succes()
    func failure(_ error: Error)
}
