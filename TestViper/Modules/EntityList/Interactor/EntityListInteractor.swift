//  
//  EntityListInteractor.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation


final class EntityListInteractor {

    // MARK: Public Properties
    
    public weak var delegate: EntityListInteractorDelegate?
    
    
    // MARK: Private Properties
    private let entityDataService: EntityDataServiceType
    private var entities: [Entity] = []

    init(dataService: EntityDataServiceType) {
        self.entityDataService = dataService
    }

}


// MARK: - EntityListInteractorType

extension EntityListInteractor: EntityListInteractorType {

    func loadList() {
        DispatchQueue.global().async {
            self.entityDataService.entities(completion: {[weak self] (result) in
                guard let strongSelf = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let entities):
                        strongSelf.entities = entities
                        strongSelf.delegate?.didLoadList(entities)
                    case .error(let error):
                        strongSelf.delegate?.didFail(with: error)
                    }
                }
            })
        }
    }
}

