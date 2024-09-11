//
//  ApiBaseModel.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 8/9/2567 BE.
//

import Foundation

struct ApiBaseModel<T: Codable> {
    var code: Int
    var data: T?

    init(code: Int = 0, data: T? = nil) {
        self.code = code
        self.data = data
    }
}

extension ApiBaseModel: Codable {

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)

        do {
            self.code = try map.decodeIfPresent(Int.self, forKey: .code) ?? 0
            self.data = try map.decodeIfPresent(T.self, forKey: .data) ?? nil
        } catch {
            self = Self()
        }
    }
}


struct ApiResponseStatus {
    let isSuccess: Bool
    let error: Error?
    let statusCode: Int

    init(_ isSuccess: Bool = true, _ error: Error? = nil, _ statusCode: Int = 0) {
        self.isSuccess = isSuccess
        self.error = error
        self.statusCode = statusCode
    }
}

enum ApiErrorState {
    case noInternetError
    case systemError
    case invalidAuthError
    case noError

    static func defaultErrorHandler(_ responses: [ApiResponseStatus]) -> ApiErrorState {
        if responses.allSatisfy({ $0.isSuccess }) {
            return .noError
        } else if !responses.allSatisfy({ $0.statusCode != 401 }) {
            return .invalidAuthError
        } else {
            return NWMonitor.shared.isConnected ? .systemError : .noInternetError
        }
    }
}

