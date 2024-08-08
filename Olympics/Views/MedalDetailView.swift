//
//  MedalDetailView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MedalDetailView: View {
    var country: CountryMedal

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if let url = URL(string: country.flag_url) {
                WebImage(url: url)
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .border(Color.primary)
                    .frame(width: 200, height: 120)
                    .padding(.bottom, 20)
                    
            }
            
            Text(country.name)
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            HStack {
                Text("Gold:")
                    .font(.headline)
                Text("\(country.gold_medals)")
                    .font(.subheadline)
            }
            HStack {
                Text("Silver:")
                    .font(.headline)
                Text("\(country.silver_medals)")
                    .font(.subheadline)
            }
            HStack {
                Text("Bronze:")
                    .font(.headline)
                Text("\(country.bronze_medals)")
                    .font(.subheadline)
            }
            HStack {
                Text("Total:")
                    .font(.headline)
                Text("\(country.total_medals)")
                    .font(.subheadline)
            }
        }
        .padding()
        .navigationTitle("Country Details")
    }
}

struct MedalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCountry = CountryMedal(
            id: "KOR",
            name: "South Korea",
            continent: "ASI",
            flag_url: "https://codante.s3.amazonaws.com/codante-apis/olympic-games/flags/KOR.png",
            gold_medals: 5,
            silver_medals: 3,
            bronze_medals: 1,
            total_medals: 9,
            rank: 1,
            rank_total_medals: 4
        )
        return MedalDetailView(country: sampleCountry)
    }
}
