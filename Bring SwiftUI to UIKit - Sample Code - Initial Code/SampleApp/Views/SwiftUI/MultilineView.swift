//
//  MultilineView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 23/03/2023.
//

import SwiftUI

struct MultilineView: View {
    @ObservedObject var trip: Trip
    var body: some View {
        TextField("Notes", text:$trip.notes, axis: .vertical)
            .lineLimit(1...10)
    }
}

struct MultilineView_Previews: PreviewProvider {
    static var previews: some View {
        MultilineView(trip: .preview)
    }
}
