// MockNavigationController.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movies_mvp
import XCTest

/// Мок навигейшн контроллера
final class MockNavigationController: UINavigationController {
    // MARK: - Private Properties

    private var presentedVC: UIViewController?

    // MARK: - Public Methods

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
