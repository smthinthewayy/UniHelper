//
//  UniversitiesModel.swift
//  UniHelper
//
//  Created by Danila Belyi on 18.12.2022.
//

import Foundation

struct UniversitiesData: Decodable {
    let universities: [University]
}

struct University: Codable {
    let name: String
    let directions: [Direction]
}

struct Direction: Codable {
    let city: String
    let faculty : String
    let name: String
    let subjects: [String]
    let scores: Int
    let budgetPlaces: Int
    let payment: Int
    let hostel: String
}
