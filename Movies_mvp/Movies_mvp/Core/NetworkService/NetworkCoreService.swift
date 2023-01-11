// NetworkCoreService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation
import SwiftyJSON

/// Сетевые запросы
class NetworkCoreService {
    // MARK: - Public methods

    func downloadJson(urlString: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        AF.request(urlString, method: .get).validate().responseJSON { response in
            switch response.result {
            case let .success(value):
                let json = JSON(value)
                completion(.success(json))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func downloadJsonResult(
        page: Int,
        requestType: RequestType,
        completion: @escaping (Result<JSON, Error>) -> Void
    ) {
        var queryItems = [URLQueryItem(name: "api_key", value: NetworkApi.token)]
        queryItems.append(URLQueryItem(name: "language", value: "ru-RU"))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = requestType.rawValue
        components.queryItems = queryItems

        guard let url = components.url else { return }

        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case let .success(value):
                let json = JSON(value)
                completion(.success(json))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
