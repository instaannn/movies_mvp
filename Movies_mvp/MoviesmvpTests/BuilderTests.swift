// BuilderTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import XCTest

/// Тестирование сборщика модулей
final class BuilderTests: XCTestCase {
    // MARK: - Private Properties

    private var builder: BuilderProtocol!

    // MARK: - Public Methods

    override func setUp() {
        builder = Builder()
    }

    override func tearDown() {
        builder = nil
    }

    func testMakeMovieCatalogViewController() {
        let router = MockRouter(builder: MockBuilder())
        let movieCatalog = builder?.makeMovieCatalogViewController(router: router)
        XCTAssertTrue(movieCatalog is MovieCatalogViewController)
    }

    func testMakeMovieDetailViewController() {
        let router = MockRouter(builder: MockBuilder())
        let movieDetail = builder?.makeMovieDetailViewController(id: 0, router: router)
        XCTAssertTrue(movieDetail is MovieDetailViewController)
    }
}
