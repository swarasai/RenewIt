//
//  SceneDelegate.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Initialize the navigation controller with SplashScreenViewController as the root
        let splashScreenVC = SplashScreenViewController()
        let navigationController = UINavigationController(rootViewController: splashScreenVC)

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
