//
//  Event.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 9/8/24.
//

struct EventResponse: Decodable {
    let data: [Event]
}

struct Event: Decodable {
    let id: Int
    let day: String
    let disciplineName: String
    let venueName: String?
    let eventName: String?
    let detailedEventName: String
    let startDate: String
    let endDate: String
    let status: String
    let isMedalEvent: Int
    let competitors: [Competitor]
    
    enum CodingKeys: String, CodingKey {
        case id
        case day
        case disciplineName = "discipline_name"
        case venueName = "venue_name"
        case eventName = "event_name"
        case detailedEventName = "detailed_event_name"
        case startDate = "start_date"
        case endDate = "end_date"
        case status
        case isMedalEvent = "is_medal_event"
        case competitors
    }
}

struct Competitor: Decodable {
    let countryId: String
    let competitorName: String
    let position: Int
    let resultMark: String?
    
    enum CodingKeys: String, CodingKey {
        case countryId = "country_id"
        case competitorName = "competitor_name"
        case position
        case resultMark = "result_mark"
    }
}
