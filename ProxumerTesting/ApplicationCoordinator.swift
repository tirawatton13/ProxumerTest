import UIKit

class ApplicationCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func startRootViewController() {
        let tabbarViewController = TabBarViewController.instantiate()
        window.rootViewController = tabbarViewController
        window.makeKeyAndVisible()
    }
}
