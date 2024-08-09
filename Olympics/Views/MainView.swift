//
//  MainView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MedalListView()
                .tabItem {
                    Image(systemName: "medal.fill")
                    Text("Medals")
                }
            
            EventListView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
            
            SportListView()
                .tabItem {
                    Image(systemName: "sportscourt.fill")
                    Text("Sports")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
