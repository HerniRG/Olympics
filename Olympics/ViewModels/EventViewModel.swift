//
//  EventViewModel.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    private var cancellable: AnyCancellable?

    func fetchEvents() {
        let url = URL(string: "https://apis.codante.io/olympic-games/events")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Event].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.events, on: self)
    }
}
