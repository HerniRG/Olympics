//
//  EventViewModel.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 9/8/24.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    private var cancellable: AnyCancellable?

    func fetchEvents(for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        guard let url = URL(string: "https://apis.codante.io/olympic-games/events?date=\(dateString)") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: EventResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.events = $0
            }
    }
}
