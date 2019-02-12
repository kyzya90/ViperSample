//
//  DependencyContainer.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/12/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import Swinject


protocol DependencyContainerType: CreateEntityContainerType, EntityListContainerType {}

class DependencyContainer: DependencyContainerType {

    private let container: Container

    init(container: Container) {
        self.container = container
    }

    private func getInstance<T>(of type: T.Type) -> T {
        guard let instance = container.resolve(type) else { fatalError("Could not get dependency") }
        return instance
    }

    var dataService: EntityDataServiceType {
        return self.getInstance(of: EntityDataServiceType.self)
    }
}
