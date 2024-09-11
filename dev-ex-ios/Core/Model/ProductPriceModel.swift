//
//  ProductPriceModel.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 10/9/2567 BE.
//

import Foundation

struct ProductPriceModel {
    var price: Double
    var originalPrice: Double
    var discount: Double?
    var discountPercent: Double?
    var currency: String
    var currencySymbol: String

    init(
        price: Double = 0,
        originalPrice: Double = 0,
        discount: Double? = nil,
        discountPercent: Double? = nil,
        currency: String = "",
        currencySymbol: String = ""
    ) {
        self.price = price
        self.originalPrice = originalPrice
        self.discount = discount
        self.discountPercent = discountPercent
        self.currency = currency
        self.currencySymbol = currencySymbol
    }
}

extension ProductPriceModel: Codable {

    enum CodingKeys: String, CodingKey {
        case price = "price"
        case originalPrice = "originalPrice"
        case discount = "discount"
        case discountPercent = "discountPercent"
        case currency = "currency"
        case currencySymbol = "currencySymbol"
    }

    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)

        do {
            self.price = try map.decodeIfPresent(Double.self, forKey: .price) ?? 0
            self.originalPrice = try map.decodeIfPresent(Double.self, forKey: .originalPrice) ?? 0
            self.discount = try map.decodeIfPresent(Double?.self, forKey: .discount) ?? nil
            self.discountPercent = try map.decodeIfPresent(Double?.self, forKey: .discountPercent) ?? nil
            self.currency = try map.decodeIfPresent(String.self, forKey: .currency) ?? ""
            self.currencySymbol = try map.decodeIfPresent(String.self, forKey: .currencySymbol) ?? ""
        } catch {
            self = Self()
        }
    }
}
