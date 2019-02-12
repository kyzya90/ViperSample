//
//  CoreDataService.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/12/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {

    private lazy var rootContext: NSManagedObjectContext = self.persistentContainer.newBackgroundContext()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "testViper")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func newBackgroundContext() -> NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = rootContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension NSManagedObjectContext {

    func saveRecursively() throws {
        guard hasChanges else { return }
        try save()
        guard let parentContext = parent else { return }
        var parentError: Error?
        parentContext.performAndWait {
            do {
                try parentContext.saveRecursively()
            } catch {
                parentError = error
            }
        }
        if let error = parentError {
            throw error
        }
    }
}

