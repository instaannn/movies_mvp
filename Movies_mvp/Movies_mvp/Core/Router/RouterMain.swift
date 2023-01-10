// RouterMain.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной роутер
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}
