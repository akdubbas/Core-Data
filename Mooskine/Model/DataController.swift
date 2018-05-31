//
//  DataController.swift
//  Mooskine
//
//  Created by Dubbasi, Amith (NonEmp) on 5/29/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

/* we choose to use classes instead of structs because we don't want to create
   multiple copies when passing between controllers
 
 Three jobs of this class are
 1) To hold a persistent container instance
 2) To help us load the persistent store coordinator
 3) To help us access the context */

class DataController
{
    let persistentContainer : NSPersistentContainer
    
    var viewContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName : String) {
        persistentContainer = NSPersistentContainer(name: modelName);
        //Now we created PersistentContainer, and will use it to store Persistent Store coordinator
    }
    func load(completion: (() -> Void)? = nil)
    {
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            if let err = error {
                print("Error loading Persistent Store :",err)
            }
            print(storeDescription)
            completion?()
        }
    }
}
