//  
//  EntityListView.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit


final class EntityListView: UIViewController {
    

    private enum Localized {

        private static var bundle: Bundle {
            return Bundle(for: EntityListView.self)
        }
    }


    private enum Constants {
    
    }


    // MARK: Outlets
    
    
    // MARK: Public Properties

    public var delegate: EntityListViewDelegate?
    
    
    // MARK: Private Properties
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate?.viewDidLoad(self)
    }
    
    
    // MARK: Actions
    
    
    // MARK: Public
    
    
    // MARK: Private


}


// MARK: - EntityListViewType

extension EntityListView: EntityListViewType {
    func reloadList() {
        
    }

    func showError(with title: String, description: String) {
        self.showAlertController(with: title,
                                 description: description)
    }

    private func showAlertController(with title: String, description: String) {
        let alertController = UIAlertController(title: title,
                                                message: description,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        alertController.addAction(action)
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
}
