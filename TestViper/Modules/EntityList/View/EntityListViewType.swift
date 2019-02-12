//  
//  EntityListViewType.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation


protocol EntityListViewType: class {
    func reloadList()
    func showError(with title: String, description: String)
}
