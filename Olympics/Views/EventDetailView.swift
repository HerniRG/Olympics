//
//  EventDetailView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let url = URL(string: event.discipline_pictogram ?? "") {
                WebImage(url: url)
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            Text(event.event_name)
                .font(.largeTitle)
            Text(event.venue_name)
                .font(.title2)
            Text("Date: \(event.day)")
                .font(.title3)
            
            ForEach(event.competitors) { competitor in
                HStack {
                    if let url = URL(string: competitor.country_flag_url) {
                        WebImage(url: url)
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: 40, height: 25)
                    }
                    Text(competitor.competitor_name)
                        .font(.headline)
                    Text(competitor.result_mark)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .navigationTitle("Event Details")
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCompetitor = Competitor(
            country_id: "ARG",
            country_flag_url: "https://codante.s3.amazonaws.com/codante-apis/olympic-games/flags/ARG.png",
            competitor_name: "Argentina",
            position: 0,
            result_position: "",
            result_winnerLoserTie: "L",
            result_mark: "1"
        )
        let sampleEvent = Event(
            id: 3407,
            day: "2024-07-24",
            discipline_name: "Football",
            discipline_pictogram: "https://codante.s3.amazonaws.com/codante-apis/olympic-games/pictograms/FBL.avif",
            name: nil,
            venue_name: "Geoffroy-Guichard Stadium",
            event_name: "Men",
            detailed_event_name: "Men's Group B",
            start_date: "2024-07-24T15:00:00+02:00",
            end_date: "2024-07-24T16:45:00+02:00",
            status: "Finished",
            is_medal_event: 0,
            is_live: 0,
            competitors: [sampleCompetitor]
        )
        return EventDetailView(event: sampleEvent)
    }
}
