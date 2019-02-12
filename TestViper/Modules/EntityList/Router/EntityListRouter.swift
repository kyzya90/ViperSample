//  
//  EntityListRouter.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit


final class EntityListRouter {
    
    // MARK: Public Properties
    
    public weak var source: UIViewController?


    // MARK: Private properties
    
    private var container: EntityListContainerType
    

    // MARK: Lifecycle

    public init(container: EntityListContainerType) {

        self.container = container
    }
}


// MARK: - EntityListRouterType

extension EntityListRouter: EntityListRouterType {
    
    /* example:
        func openOtherModule(with delegate: OtherModuleDelegate?) {
 
            let view = OtherModuleBuilder.view(with: delegate)
 
            source.show(view, animated: true)
        }
    */
}
