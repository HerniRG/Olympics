//
//  FilterView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedCountry: String?
    @Binding var selectedDiscipline: String?
    @Binding var selectedVenue: String?
    @Binding var selectedDate: String?
    @Binding var selectedCompetitor: String?
    
    var applyFilters: () -> Void
    
    var body: some View {
        VStack {
            TextField("Country", text: Binding(
                get: { selectedCountry ?? "" },
                set: { selectedCountry = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 10)
            
            TextField("Discipline", text: Binding(
                get: { selectedDiscipline ?? "" },
                set: { selectedDiscipline = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 10)
            
            TextField("Venue", text: Binding(
                get: { selectedVenue ?? "" },
                set: { selectedVenue = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 10)
            
            TextField("Date (YYYY-MM-DD)", text: Binding(
                get: { selectedDate ?? "" },
                set: { selectedDate = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 10)
            
            TextField("Competitor", text: Binding(
                get: { selectedCompetitor ?? "" },
                set: { selectedCompetitor = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 20)
            
            Button(action: applyFilters) {
                Text("Apply Filters")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(
            selectedCountry: .constant(nil),
            selectedDiscipline: .constant(nil),
            selectedVenue: .constant(nil),
            selectedDate: .constant(nil),
            selectedCompetitor: .constant(nil),
            applyFilters: {}
        )
    }
}
