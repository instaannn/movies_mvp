// MovieDetailViewProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол детального описания фильма
protocol MovieDetailViewProtocol: AnyObject {
    func succes()
    func failure(_ error: Error)
    func setupUI(movieDetail: MovieDetail?)
}
