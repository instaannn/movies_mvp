// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public properties

    var window: UIWindow?

    // MARK: - Private properties

    private var navigationController = UINavigationController()
    private var builder = Builder()

    // MARK: - Public methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .white
        let router = Router(navigationController: navigationController, builder: builder)
        router.movieCatalogViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
