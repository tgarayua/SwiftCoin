//
//  Coin.swift
//  SwiftCoin
//
//  Created by Thomas Garayua on 1/3/24.
//

import Foundation

struct Coin: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double?
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice
        case marketCap
        case marketCapRank
        case fullyDilutedValuation
        case totalVolume
        case high24H
        case low24H
        case priceChange24H
        case priceChangePercentage24H
        case marketCapChange24H
        case marketCapChangePercentage24H
        case circulatingSupply
        case totalSupply
        case maxSupply
        case ath
        case athChangePercentage
        case athDate
        case atl
        case atlChangePercentage
        case atlDate
        case lastUpdated
        case sparklineIn7D
        case priceChangePercentage24HInCurrency
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
