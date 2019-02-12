//  
//  EntityListPresenter.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation

final class EntityListPresenter {
    

    // MARK: Private Data Structures
    
    private enum Localized {

        private static var bundle: Bundle {
            return Bundle(for: EntityListView.self)
        }
    }


    private enum Constants {
        
    }
    
    
    // MARK: Public Properties

    public weak var view: EntityListViewType?
    public weak var moduleDelegate: EntityListModuleDelegate?
    
    
    // MARK: Private Properties

    private let interactor: EntityListInteractorType
    private let router: EntityListRouterType
    
    
    // MARK: Lifecycle

    public init(router: EntityListRouterType,
                interactor: EntityListInteractorType) {
        
        self.router = router
        self.interactor = interactor
    }
}


// MARK: - EntityListModuleType

extension EntityListPresenter: EntityListModuleType {

}


// MARK: - EntityListInteractorDelegate

extension EntityListPresenter: EntityListInteractorDelegate {

    func didLoadList(_ list: [Entity]) {
    }

    func didFail(with error: Error) {
        self.view?.showError(with: "", description: "")
    }

    
}


// MARK: - EntityListViewDelegate

extension EntityListPresenter: EntityListViewDelegate {
    func entity(at index: Int) {

    }

    func numberOfEntities() -> Int {
        return 10
    }

    
//    notify delegate that module is ready and can be setup
//    delegate can save this module and provide data via `update(with:)` method
//    feel free to add your functionality here
    func viewDidLoad(_ view: EntityListViewType) {

        self.moduleDelegate?.moduleDidLoad(self)
        self.interactor.loadList()
    }
}
