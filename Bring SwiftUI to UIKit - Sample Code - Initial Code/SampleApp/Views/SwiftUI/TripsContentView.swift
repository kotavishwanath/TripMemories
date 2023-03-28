//
//  TripsContentView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 26/03/2023.
//

import SwiftUI
import CoreData

enum ActiveNavigationDestination: Hashable {
    case tripsListView(TripFilters, String)
    case detailsView(Trip)
}

struct TripsContentView: View {
    
    @State private var searchText = ""
    @State private var newTripsSheetPresented = false
    
    var body: some View {
        NavigationStack {
            if !searchText.isEmpty {
                TripsGridView(filter: TripFilters.title(searchText), title: "Search")
            } else {
                List {
                    RecentTripsSectionView()
                    FavouriteTripsSectionView()
                    CategoriesSectionView()
                }
                .listStyle(.plain)
                .navigationTitle("Trips")
                .navigationBarTitleDisplayMode(.large)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationDestination(for: ActiveNavigationDestination.self) { destination in
                    switch destination {
                    case .detailsView(let trip):
                        TripDetailView(trip: trip)
                            .navigationTitle(trip.title)
                            .navigationBarTitleDisplayMode(.inline)
                    case .tripsListView(let filter, let title):
                        TripsGridView(filter: filter, title: title)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button { newTripsSheetPresented = true }
                        label: { Image(systemName: "plus")}
                    }
                }
                .sheet(isPresented: $newTripsSheetPresented, onDismiss: {
                    newTripsSheetPresented = false
                }, content: {
                    let context = PersistenceController.shared.makeChildViewContext()
                    let trip = Trip.newTrip(with: context)
                    TripEditView(trip: trip, taskContext: context)
                        .ignoresSafeArea()
                })
            }
        }
        .searchable(text: $searchText)
        
        
    }
}

struct TripsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TripsContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.persistentContainer.viewContext)
    }
}
