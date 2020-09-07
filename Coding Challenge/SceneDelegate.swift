//
//  SceneDelegate.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var rootController: UINavigationController {
        let navigation = UINavigationController()
        window?.rootViewController = navigation
        return window?.rootViewController as! UINavigationController
    }
    
    private lazy var coordinator: Coordinatable = self.makeCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        coordinator.start()
    }

}

private extension SceneDelegate {
    func makeCoordinator() -> Coordinatable {
        return AppCoordinator(router: Router(rootController: rootController), factory: CoordinatorFactory())
    }
}

