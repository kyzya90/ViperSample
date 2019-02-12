//  
//  EntityListAssembly.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit


public final class EntityListAssembly {
    

    private enum Constants {
        
        enum Storyboard {
            
            static let name = "EntityList"
            static let viewIdentifier = "EntityListView"
        }
    }


    public class func build(withView view: UIViewController,
                            container: EntityListContainerType,
                            moduleDelegate: EntityListModuleDelegate?) {
        
        guard let requiredView = view as? EntityListView else {
            return
        }
        
        self.build(withView: requiredView,
                   container: container,
                   moduleDelegate: moduleDelegate)
    }

    
    static let storyboard = UIStoryboard(name: Constants.Storyboard.name,
                                         bundle: Bundle(for: EntityListView.self))
    
    public class func view(withContainer container: EntityListContainerType,
                           moduleDelegate: EntityListModuleDelegate?) -> UIViewController {
        
        let view = self.storyboard
            .instantiateViewController(withIdentifier: Constants.Storyboard.viewIdentifier)
        
        if let requiredView = view as? EntityListView {
            
            self.build(withView: requiredView,
                       container: container,
                       moduleDelegate: moduleDelegate)
        }
        
        return view
    }
    
    
    fileprivate class func build(withView view: EntityListView,
                                 container: EntityListContainerType,
                                 moduleDelegate: EntityListModuleDelegate?) {
        
        let interactor = EntityListInteractor()
        
        let router = EntityListRouter(container: container)
        router.source = view
        
        let presenter = EntityListPresenter(router: router, interactor: interactor)
        
        presenter.view = view
        presenter.moduleDelegate = moduleDelegate
        
        view.delegate = presenter

        interactor.delegate = presenter
    }
}
