//  
//  CreateEntityInteractor.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation

final class CreateEntityInteractor {

    // MARK: - Public Properties

    public weak var delegate: CreateEntityInteractorDelegate?

    // MARK: - Private Properties
    private let dataService: EntityDataServiceType

    init(dataService: EntityDataServiceType) {
        self.dataService = dataService
    }
}

// MARK: - CreateEntityInteractorType

extension CreateEntityInteractor: CreateEntityInteractorType {
    func save(_ entity: Entity) {
        DispatchQueue.global().async {
            self.dataService.saveEntity(entity,
                                        completion: {[weak self] (result) in
                                            DispatchQueue.main.async {
                                                guard let strongSelf = self else { return }
                                                switch result {
                                                case .success:
                                                    strongSelf.delegate?.didSave()
                                                case .error(let error):
                                                    strongSelf.delegate?.failed(with: error)
                                                }
                                            }
            })
        }
    }
}
