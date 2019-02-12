//  
//  EntityListViewDelegate.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation


protocol EntityListViewDelegate: class {
       
    func viewDidLoad(_ view: EntityListViewType)
    func entity(at index: Int)
    func numberOfEntities() -> Int
}
