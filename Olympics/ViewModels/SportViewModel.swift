//
//  SportViewModel.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation
import Combine

class SportViewModel: ObservableObject {
    @Published var sports: [Sport] = []
    private var cancellable: AnyCancellable?

    func fetchSports() {
        let url = URL(string: "https://apis.codante.io/olympic-games/disciplines")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SportApiResponse.self, decoder: JSONDecoder())
            .replaceError(with: SportApiResponse(data: []))
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .assign(to: \.sports, on: self)
    }
}
