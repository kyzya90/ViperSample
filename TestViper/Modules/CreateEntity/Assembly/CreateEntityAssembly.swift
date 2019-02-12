//  
//  CreateEntityAssembly.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

public final class CreateEntityAssembly {

    fileprivate enum Constants {

        enum Storyboard {

            static let name = "CreateEntity"
            static let viewIdentifier = "CreateEntityView"
        }
    }

    public class func build(withView view: UIViewController,
                            container: CreateEntityContainerType,
                            moduleDelegate: CreateEntityModuleDelegate?) {

        guard let requiredView = view as? CreateEntityView else {
            return
        }

        self.build(withView: requiredView,
                   container: container,
                   moduleDelegate: moduleDelegate)
    }

    static let storyboard = UIStoryboard(name: Constants.Storyboard.name,
                                         bundle: Bundle(for: CreateEntityView.self))

    public class func view(withContainer container: CreateEntityContainerType,
                           moduleDelegate: CreateEntityModuleDelegate?) -> UIViewController {

        let view = self.storyboard
            .instantiateViewController(withIdentifier: Constants.Storyboard.viewIdentifier)

        if let requiredView = view as? CreateEntityView {

            self.build(withView: requiredView,
                       container: container,
                       moduleDelegate: moduleDelegate)
        }

        return view
    }

    fileprivate class func build(withView view: CreateEntityView,
                                 container: CreateEntityContainerType,
                                 moduleDelegate: CreateEntityModuleDelegate?) {

        let interactor = CreateEntityInteractor()

        let router = CreateEntityRouter(container: container)
        router.source = view

        let presenter = CreateEntityPresenter(router: router, interactor: interactor)

        presenter.view = view
        presenter.moduleDelegate = moduleDelegate

        view.delegate = presenter

        interactor.delegate = presenter
    }
}
