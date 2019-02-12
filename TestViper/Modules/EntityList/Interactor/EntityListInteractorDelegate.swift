//  
//  EntityListInteractorDelegate.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation


protocol EntityListInteractorDelegate: class {
    func didLoadList(_ list: [Entity])
    func didFail(with error: Error)
}
