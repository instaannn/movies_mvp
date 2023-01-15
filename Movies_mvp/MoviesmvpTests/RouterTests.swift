// RouterTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import XCTest

/// Тестирование роутера
final class RouterTests: XCTestCase {
    // MARK: - Private Properties

    private var router: RouterProtocol!
    private var navigationController = MockNavigationController()
    private let builder = Builder()

    // MARK: - Public Methods

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, builder: builder)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showMovieDetailViewController(id: 0)
        let detailVC = navigationController.presentedVC
        XCTAssertTrue(detailVC is MovieDetailViewController)
    }
}
