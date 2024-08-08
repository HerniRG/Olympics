//
//  MedalListView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MedalListView: View {
    @ObservedObject var viewModel = MedalViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.countries.sorted(by: { $0.total_medals > $1.total_medals })) { country in
                NavigationLink(destination: MedalDetailView(country: country)) {
                    HStack {
                        if let url = URL(string: country.flag_url) {
                            WebImage(url: url)
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFit()
                                .frame(width: 40, height: 25)
                                .background(Color.clear)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text(country.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            HStack {
                                MedalView(type: "🥇", count: country.gold_medals)
                                MedalView(type: "🥈", count: country.silver_medals)
                                MedalView(type: "🥉", count: country.bronze_medals)
                                MedalView(type: "🏅", count: country.total_medals)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Medals by Country")
            .onAppear {
                viewModel.fetchMedals()
            }
        }
    }
}


struct MedalView: View {
    var type: String
    var count: Int

    var body: some View {
        HStack {
            Text(type)
            Text("\(count)")
                .frame(width: 30, alignment: .leading)
                .foregroundColor(.primary)
        }
    }
}

struct MedalListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MedalViewModel()
        viewModel.countries = [
            CountryMedal(id: "KOR", name: "South Korea", continent: "ASI", flag_url: "https://codante.s3.amazonaws.com/codante-apis/olympic-games/flags/KOR.png", gold_medals: 5, silver_medals: 3, bronze_medals: 1, total_medals: 9, rank: 1, rank_total_medals: 4),
            CountryMedal(id: "JPN", name: "Japan", continent: "ASI", flag_url: "https://codante.s3.amazonaws.com/codante-apis/olympic-games/flags/JPN.png", gold_medals: 5, silver_medals: 2, bronze_medals: 4, total_medals: 11, rank: 2, rank_total_medals: 3)
        ]
        return MedalListView(viewModel: viewModel)
    }
}
