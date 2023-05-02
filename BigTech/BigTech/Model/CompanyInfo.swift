//
//  CompanyInfo.swift
//  BigTech
//
//  Created by SERGEI on 30.03.2023.
//

import Foundation
import Combine

// MARK: - CompanyInfo
struct CompanyInfo: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employers: [Employer]
    let priceList: [PriceList]

    enum CodingKeys: String, CodingKey {
        case name, employers
        case priceList = "price_list"
    }
}

// MARK: - Employer
struct Employer: Codable, Hashable {
    let name, surname: String
    let old: Int
    let gender: String
    let position: Position
    let gotPositionIn: String
    let avatarURL: String?
    let coordinates: Coordinates?

    enum CodingKeys: String, CodingKey {
        case name, surname, old, gender, position
        case gotPositionIn = "got_position_in"
        case avatarURL = "avatar_url"
        case coordinates
    }
}

// MARK: - Coordinates
struct Coordinates: Codable, Hashable {
    let lat, lon: Double
}

// MARK: - Position
struct Position: Codable, Hashable {
    let title: String
    let salary: Int
}

// MARK: - PriceList
struct PriceList: Codable, Hashable {
    let title: String
    let price: Int
}
