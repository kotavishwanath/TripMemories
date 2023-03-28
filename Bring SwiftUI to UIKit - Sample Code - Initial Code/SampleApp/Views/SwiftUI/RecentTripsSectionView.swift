//
//  RecentTripsSectionView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 27/03/2023.
//

import SwiftUI

struct RecentTripsSectionView: View {
    var body: some View {
        Section {
            TripHorizontalListView(fetchRequest: Trip.recentTripsRequest(), cardSize: .largeCard)
        } header: {
            TripsSectionHeaderView(sectionTitle: "Recent Trips", sectionFilter: .all)
        }
    }
}

struct RecentTripsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTripsSectionView()
    }
}
