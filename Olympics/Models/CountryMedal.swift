//
//  CountryMedal.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation

struct CountryMedal: Identifiable, Codable {
    var id: String
    var name: String
    var continent: String
    var flag_url: String
    var gold_medals: Int
    var silver_medals: Int
    var bronze_medals: Int
    var total_medals: Int
    var rank: Int
    var rank_total_medals: Int
}

struct ApiResponse: Codable {
    var data: [CountryMedal]
}
