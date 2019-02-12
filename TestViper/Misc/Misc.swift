//
//  Misc.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

typealias Completion<T> = (Result<T>) -> ()

enum Result<T> {
    case success(T)
    case error(Error)
}

extension Result where T == Void {
    static var success: Result {
        return .success(())
    }
}
