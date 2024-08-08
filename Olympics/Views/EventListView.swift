//
//  EventListView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject var viewModel = EventViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.events) { event in
                VStack(alignment: .leading) {
                    Text(event.event_name)
                        .font(.headline)
                    Text(event.venue_name)
                        .font(.subheadline)
                    Text("Date: \(event.day)")
                        .font(.caption)
                }
            }
            .navigationTitle("Olympic Events")
            .onAppear {
                viewModel.fetchEvents()
            }
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
