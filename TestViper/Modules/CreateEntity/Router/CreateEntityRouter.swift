//  
//  CreateEntityRouter.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

final class CreateEntityRouter {

    // MARK: - Public Properties

    public weak var source: UIViewController?

    // MARK: - Private properties

    private var container: CreateEntityContainerType

    // MARK: - Lifecycle

    public init(container: CreateEntityContainerType) {

        self.container = container
    }
}

// MARK: - CreateEntityRouterType

extension CreateEntityRouter: CreateEntityRouterType {
    
    func showList(with container: String) {
        let entityList = EntityListAssembly.view(withContainer: EntityListContainerStub(),
                                                 moduleDelegate: nil)
        self.source?.navigationController?.pushViewController(entityList, animated: true)
    }


    /* example:
        func openOtherModule(with delegate: OtherModuleDelegate?) {
 
            let view = OtherModuleBuilder.view(with: delegate)
 
            source.show(view, animated: true)
        }
    */
}
