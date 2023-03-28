//
//  TripDetailView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 28/03/2023.
//

import SwiftUI

struct TripDetailView: UIViewControllerRepresentable {
    
    var trip: Trip
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let detailViewController = TripDetailViewController(with: trip)
        return detailViewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
}
