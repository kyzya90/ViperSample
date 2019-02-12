//
//  AppDelegate.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let container = CreateEntityContainerStub()
        let viewController = CreateEntityAssembly.view(withContainer: container,
                                                       moduleDelegate: nil)
        let rootNavigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = rootNavigationController

        return true
    }
}

