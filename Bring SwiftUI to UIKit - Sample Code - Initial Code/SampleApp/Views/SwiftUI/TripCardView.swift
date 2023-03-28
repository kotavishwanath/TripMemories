//
//  TripCardView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 27/03/2023.
//

import SwiftUI

struct TripCardView: View {
    @ObservedObject var trip: Trip
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: trip.heroImage ?? UIImage(systemName: noImageSymbol)!)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 4.0, style: .continuous))
            Text(trip.title)
                .foregroundColor(.primary)
                .lineLimit(1)
            Text(trip.formattedStartDate)
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
        .frame(width: 180)
    }
}

struct TripCardView_Previews: PreviewProvider {
    static var previews: some View {
        TripCardView(trip: .preview)
    }
}
