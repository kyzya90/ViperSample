//  
//  EntityListPresenter.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

final class EntityListPresenter {
    
    // MARK: Private Data Structures
    
    private enum Localized {

        private static var bundle: Bundle {
            return Bundle(for: EntityListView.self)
        }
    }

    // MARK: Public Properties

    public weak var view: EntityListViewType?
    public weak var moduleDelegate: EntityListModuleDelegate?
    
    
    // MARK: Private Properties

    private let interactor: EntityListInteractorType
    private let router: EntityListRouterType
    private var entities: [EntityListViewModel] = []
    
    // MARK: Lifecycle

    public init(router: EntityListRouterType,
                interactor: EntityListInteractorType) {
        
        self.router = router
        self.interactor = interactor
    }
}


// MARK: - EntityListModuleType
extension EntityListPresenter: EntityListModuleType { }


// MARK: - EntityListInteractorDelegate

extension EntityListPresenter: EntityListInteractorDelegate {

    func didLoadList(_ list: [Entity]) {
        self.entities = list.map( { EntityListViewModel(name: $0.name,
                                                        nameColor: UIColor.green,
                                                        value: $0.value,
                                                        valueColor: UIColor.blue) } )
        self.view?.reloadList()
    }

    func didFail(with error: Error) {
        self.view?.showError(with: "", description: "")
    }
}


// MARK: - EntityListViewDelegate

extension EntityListPresenter: EntityListViewDelegate {
    func entity(at index: Int) -> EntityListViewModel {
        return self.entities[index]
    }

    func numberOfEntities() -> Int {
        return self.entities.count
    }

    func viewDidLoad(_ view: EntityListViewType) {

        self.moduleDelegate?.moduleDidLoad(self)
        self.interactor.loadList()
    }
}
