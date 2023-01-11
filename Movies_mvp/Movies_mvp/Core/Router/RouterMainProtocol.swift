// RouterMainProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной роутер
protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}
