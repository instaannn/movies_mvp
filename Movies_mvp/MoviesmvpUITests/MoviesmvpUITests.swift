// MoviesmvpUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

/// UI Тесты
final class MoviesmvpUITests: XCTestCase {
    // MARK: - Constants

    private enum Constants {
        static let identifierCatalogTableView = "MovieCatalogTableView"
    }

    // MARK: - Private Properties

    private let app = XCUIApplication()

    // MARK: - Public methods

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}

    func testHasATableView() {
        XCTAssertNotNil(app.tables.matching(identifier: Contants.identifierCatalogTableView))
    }

    func testTableViews() {
        let movieCatalogTableView = app.tables.matching(identifier: Constants.identifierCatalogTableView)
        XCTAssertNotNil(movieCatalogTableView)
        movieCatalogTableView.element.swipeUp()
        movieCatalogTableView.element.swipeDown()
        app.cells.firstMatch.tap()

        let moviesMvpMoviedetailviewNavigationBar = app.navigationBars["Movies_mvp.MovieDetailView"]
        moviesMvpMoviedetailviewNavigationBar.buttons["Share"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
