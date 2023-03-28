//
//  TripsSectionHeaderView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 27/03/2023.
//

import SwiftUI

struct TripsSectionHeaderView: View {
    var sectionTitle = "Trips"
    var sectionFilter: TripFilters = .all
    var navigationTitle = "Trips"
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
            Spacer()
            NavigationLink(value: ActiveNavigationDestination.tripsListView(sectionFilter, navigationTitle)) {
                Text("See all")
            }
        }
    }
}

struct TripsSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TripsSectionHeaderView()
    }
}
