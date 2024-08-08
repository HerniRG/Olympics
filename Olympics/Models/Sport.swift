//
//  Sport.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation

struct Sport: Identifiable, Codable {
    var id: String
    var name: String
    var pictogram_url: String?
}

struct SportApiResponse: Codable {
    var data: [Sport]
}
