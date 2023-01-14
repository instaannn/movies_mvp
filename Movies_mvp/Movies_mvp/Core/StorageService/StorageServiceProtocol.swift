// StorageServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

protocol StorageServiceProtocol {
    func set(_ key: String)
    func get(_ key: String) -> String?
}
