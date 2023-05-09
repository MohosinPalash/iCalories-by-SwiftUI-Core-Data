//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Mohosin Islam Palash on 2/5/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    //inject database
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
