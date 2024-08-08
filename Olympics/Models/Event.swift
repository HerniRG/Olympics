//
//  Event.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation

struct Event: Identifiable, Codable {
    var id: Int
    var discipline_name: String
    var venue_name: String
    var event_name: String
    var day: String
}
