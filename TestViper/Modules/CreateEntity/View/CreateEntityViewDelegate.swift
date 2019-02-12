//  
//  CreateEntityViewDelegate.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

protocol CreateEntityViewDelegate: class {

    func viewDidLoad(_ view: CreateEntityViewType)
    func didTapCreateEntityButton(_ button: UIButton,
                                  name: String,
                                  value: String)
    func didTapShowListButton(_ button: UIButton)
}
