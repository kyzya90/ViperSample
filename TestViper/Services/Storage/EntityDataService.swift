//
//  EntityDataService.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/12/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import CoreData

protocol EntityDataServiceType {
    func entities(completion: @escaping Completion<[Entity]>)
    func saveEntity(_ entity: Entity, completion: Completion<Void>)
}

class EntityDataService: EntityDataServiceType {

    private enum Constants {
        static let entityName = "CDEntity"
    }

    private let coreDataService: CoreDataService

    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }

    func saveEntity(_ entity: Entity, completion: Completion<Void>) {
        let context = self.coreDataService.newBackgroundContext()
        guard let entityDescriptor = NSEntityDescription.entity(forEntityName: Constants.entityName, in: context) else { return }
        let item = CDEntity(entity: entityDescriptor, insertInto: context)
        item.name = entity.name
        item.absoluteValue = entity.value

        do {
            try context.saveRecursively()
            completion(.success)
        } catch {
            completion(.error(error))
        }
    }

    func entities(completion: @escaping (Result<[Entity]>) -> ()) {
        let context = self.coreDataService.newBackgroundContext()
        let fetchRequest = NSFetchRequest<CDEntity>(entityName: Constants.entityName)
        do {
            let items = try context.fetch(fetchRequest)
            let entities = items.map( { return Entity(name: $0.name ?? "",
                                                      value: $0.absoluteValue ?? "") } )
            completion(.success(entities))
        } catch {
            completion(.error(error))
        }
    }
}

