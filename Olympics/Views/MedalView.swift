//
//  MedalView.swift
//  Olympics
//
//  Created by Hernán Rodríguez on 8/8/24.
//

import SwiftUI

struct MedalView: View {
    var type: String
    var count: Int

    var body: some View {
        HStack {
            Text(type)
            Text("\(count)")
                .frame(width: 30, alignment: .leading) // Asegura que los números estén alineados
        }
    }
}

struct MedalView_Previews: PreviewProvider {
    static var previews: some View {
        MedalView(type: "🥇", count: 5)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
