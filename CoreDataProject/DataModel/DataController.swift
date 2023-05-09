//
//  DataController.swift
//  CoreDataProject
//
//  Created by Mohosin Islam Palash on 2/5/23.
//

//NSPersistentContainer(encapsulate core Data),
//NSManagedObjectContext: an object space to manipulate and track changes to managed objects

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data with \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()                  //ISSUE: Recursive call
            print("Data is saved!")
        } catch {
            print("Data is not saved!")
        }
    }
    //insert
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    //update
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
    
}
