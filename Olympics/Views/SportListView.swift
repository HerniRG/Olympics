//
//  SportListView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SportListView: View {
    @ObservedObject var viewModel = SportViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.sports) { sport in
                HStack {
                    if let url = URL(string: sport.pictogram_url ?? "") {
                        ZStack {
                            Rectangle()
                                .frame(width: 60, height: 60)
                                .cornerRadius(16)
                                .padding(5)
                                .foregroundColor(Color.white)
                            WebImage(url: url)
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .background(.white)
                        }
                            
                        
                    }
                    Text(sport.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Olympic Sports")
            .onAppear {
                viewModel.fetchSports()
        }
        }
    }
}

struct SportListView_Previews: PreviewProvider {
    static var previews: some View {
        SportListView()
    }
}
