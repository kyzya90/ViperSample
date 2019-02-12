//  
//  CreateEntityPresenter.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

final class CreateEntityPresenter {

    // MARK: - Private Data Structures

    fileprivate enum Constants {
        static let emptyName = ""
        static let namePlaceholder = "Name (must not be empty)"
        static let emptyValue = ""
        static let valuePlaceholder = "Value (default is an empty string)"
    }

    fileprivate enum Localized {

    }

    // MARK: - Public Properties

    public weak var view: CreateEntityViewType?
    public weak var moduleDelegate: CreateEntityModuleDelegate?

    // MARK: - Private Properties

    fileprivate let interactor: CreateEntityInteractorType
    fileprivate let router: CreateEntityRouterType

    // MARK: - Lifecycle

    public init(router: CreateEntityRouterType,
                interactor: CreateEntityInteractorType) {

        self.router = router
        self.interactor = interactor
    }
}

// MARK: - CreateEntityModuleType

extension CreateEntityPresenter: CreateEntityModuleType {

}

// MARK: - CreateEntityInteractorDelegate

extension CreateEntityPresenter: CreateEntityInteractorDelegate {
    func didSave() {
        self.view?.setup(with: self.emptyViewModel())
    }

    func failed(with error: Error) {
        //show error
    }


}

// MARK: - CreateEntityViewDelegate

extension CreateEntityPresenter: CreateEntityViewDelegate {
    
    func didTapCreateEntityButton(_ button: UIButton, name: String, value: String) {
        let entity = Entity(name: name,
                            value: value)

        self.interactor.save(entity)
    }

    func didTapShowListButton(_ button: UIButton) {
        self.router.showList()
    }

    func viewDidLoad(_ view: CreateEntityViewType) {
        self.moduleDelegate?.moduleDidLoad(self)
        self.view?.setup(with: self.emptyViewModel())
    }

    func emptyViewModel() -> CreateEntityViewModel {
        let viewModel = CreateEntityViewModel(name: Constants.emptyName,
                                              namePlaceholder: Constants.namePlaceholder,
                                              value: Constants.emptyValue,
                                              valuePlaceholder: Constants.valuePlaceholder)
        return viewModel
    }
}
