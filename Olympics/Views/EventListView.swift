//  SportListView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI

struct EventListView: View {
    @State private var calendarDay: Date = Date()
    @ObservedObject private var viewModel = EventViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                DatePicker("Select Date", selection: $calendarDay, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                    .onChange(of: calendarDay) { newValue, oldValue in
                        viewModel.fetchEvents(for: newValue)
                    }
                
                if viewModel.events.isEmpty {
                    Text("No events available for this date.")
                        .font(.headline)
                        .padding()
                    Spacer()
                } else {
                    List(viewModel.events, id: \.id) { event in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Event:")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(event.detailedEventName)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text("Venue:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(event.venueName ?? "Unknown Venue")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            
                            Text("Discipline:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(event.disciplineName)
                                .font(.caption)
                                .foregroundColor(.primary)
                            
                            Text("Competitors:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            ForEach(event.competitors, id: \.competitorName) { competitor in
                                HStack {
                                    Text(competitor.competitorName)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Events")
        }
        .onAppear {
            viewModel.fetchEvents(for: calendarDay)
        }
    }
}

#Preview {
    EventListView()
}
