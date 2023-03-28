//
//  TripHorizontalListView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 27/03/2023.
//

import SwiftUI
import CoreData

enum TripCardSize {
    case largeCard
    case regularCard
}

struct TripHorizontalListView: View {
    @FetchRequest var trips: FetchedResults<Trip>
    private let tripCardSize: TripCardSize
    
    init(fetchRequest: NSFetchRequest<Trip>, cardSize: TripCardSize) {
        _trips = FetchRequest(fetchRequest: fetchRequest)
        tripCardSize = cardSize
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(trips) { trip in
                    NavigationLink(value: ActiveNavigationDestination.detailsView(trip)) {
                        switch tripCardSize {
                        case .largeCard:
                            TripLargeCardView(trip: trip)
                        case .regularCard:
                            TripCardView(trip: trip)
                        }
                    }
                }
            }
            .padding([.leading, .trailing])
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        .listSectionSeparator(.hidden, edges: .top)
        .scrollIndicators(.hidden)
    }
}

//struct TripHorizontalListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TripHorizontalListView()
//    }
//}
