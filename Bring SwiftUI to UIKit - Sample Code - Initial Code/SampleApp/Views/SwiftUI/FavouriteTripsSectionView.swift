//
//  FavouriteTripsSectionView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 27/03/2023.
//

import SwiftUI

struct FavouriteTripsSectionView: View {
    var body: some View {
        Section {
            TripHorizontalListView(fetchRequest: Trip.recentFavoriteTripsRequest(), cardSize: .regularCard)
        } header: {
            TripsSectionHeaderView(sectionTitle: "Favorites", sectionFilter: .favorite)
        }
    }
}

struct FavouriteTripsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteTripsSectionView()
    }
}
