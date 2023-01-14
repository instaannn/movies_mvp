// RealmServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Протокол реалма
protocol RealmServiceProtocol {
    func save<T: Object>(items: [T])
    func get<T: Object>(_ type: T.Type, id: Int) -> MovieDetail?
    func getMovies<T: Object>(_ type: T.Type, movieType: String) -> Results<T>?
}
