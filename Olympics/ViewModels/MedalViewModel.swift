//
//  MedalViewModel.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import Foundation
import Combine

class MedalViewModel: ObservableObject {
    @Published var countries: [CountryMedal] = []
    private var cancellable: AnyCancellable?

    func fetchMedals() {
        let url = URL(string: "https://apis.codante.io/olympic-games/countries")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ApiResponse.self, decoder: JSONDecoder())
            .replaceError(with: ApiResponse(data: []))
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .assign(to: \.countries, on: self)
    }
}
