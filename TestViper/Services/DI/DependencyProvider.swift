//
//  DependencyProvider.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/12/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import Swinject

protocol DependencyProviderType {
    var createEntityContainer: CreateEntityContainerType { get }
    var entityListContainer: EntityListContainerType { get }
}

class DependencyProvider: DependencyProviderType {

    var createEntityContainer: CreateEntityContainerType {
        return self.container
    }

    var entityListContainer: EntityListContainerType {
        return self.container
    }

    private let container: DependencyContainer

    init() {
        let container = Container()
        self.container = DependencyContainer(container: container)
        self.setupContainer(container: container)

    }

    private func setupContainer(container: Container) {
        container.register(EntityDataServiceType.self) { _ -> EntityDataServiceType in
            return EntityDataService(coreDataService: CoreDataService())
        }.inObjectScope(.container)
    }
}
