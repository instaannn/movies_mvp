// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Сохранение и чтение данных из реалм
final class RealmService: RealmServiceProtocol {
    // MARK: - Private Properties

    private let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

    // MARK: - Public methods

    func save<T: Object>(items: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func getMovies<T: Object>(_ type: T.Type, movieType: String) -> Results<T>? {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            let object = realm.objects(T.self).filter("movieType = %@", movieType)
            return object
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    func get<T: Object>(_ type: T.Type) -> MovieDetail? {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            return realm.object(ofType: MovieDetail.self, forPrimaryKey: "id")
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
