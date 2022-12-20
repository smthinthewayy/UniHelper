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
//    let type: String
//    let region: String
//    let city: String
//    let phone: String
//    let email: String
//    let emailac: String
//    let website: String
//    let address: String
//    let director: String
//    let post: String
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
