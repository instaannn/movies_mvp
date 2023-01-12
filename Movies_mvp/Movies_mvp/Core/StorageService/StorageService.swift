// StorageService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import KeychainAccess

/// Хранилище данных
final class StorageService {
    // MARK: - Public Properties

    static let shared = StorageService()

    // MARK: - Private Properties

    private let keychainAccess = KeychainAccess.Keychain()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public methods

    func set(_ key: String) {
        try? keychainAccess.set(NetworkApi.token, key: key)
    }

    func get(_ key: String) -> String? {
        try? keychainAccess.get(key)
    }
}
