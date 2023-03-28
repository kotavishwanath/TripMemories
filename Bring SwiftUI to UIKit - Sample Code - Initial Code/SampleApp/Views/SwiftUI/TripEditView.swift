//
//  TripEditView.swift
//  SampleApp
//
//  Created by Kota, Vishwanath (V.) on 28/03/2023.
//

import SwiftUI
import CoreData

struct TripEditView: UIViewControllerRepresentable {
    var trip: Trip
    var taskContext: NSManagedObjectContext
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let tripEditViewController = TripEditController(with: trip, context: taskContext)
        let navigationController = UINavigationController(rootViewController: tripEditViewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
}
