//  
//  CreateEntityInteractor.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation

final class CreateEntityInteractor {

    // MARK: - Private Data Structures

    // MARK: - Public Properties

    public weak var delegate: CreateEntityInteractorDelegate?

    // MARK: - Private Properties

    // MARK: - Lifecycle

    // MARK: - Public

    // MARK: - Private

}

// MARK: - CreateEntityInteractorType

extension CreateEntityInteractor: CreateEntityInteractorType {
    func save(_ entity: Entity) {
        self.delegate?.didSave()
    }
}
