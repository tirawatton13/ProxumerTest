import UIKit
import ESTabBarController_swift

class TabBarViewController: ESTabBarController, UITabBarControllerDelegate {

    static func instantiate() -> TabBarViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let tabBarController = storyboard.instantiateInitialViewController() as! TabBarViewController
        
        return tabBarController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarController()
        delegate = self
        tabBar.isTranslucent = false

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBarController()
    }

    private func setupTabBarController() {
        let vc1 = HomeViewController.instantiate()
        let vc2 = ViewController.instantiate()
        let vc3 = AchievementViewController.instantiate(viewModel: AchievementListViewModel())
        let vc4 = NotificationViewController.instantiate(viewModel: NotificationListViewModel())

        vc1.tabBarItem = ESTabBarItem.init(image: UIImage(named: "icons8-home-30"), selectedImage: UIImage(named: ""))
        vc2.tabBarItem = ESTabBarItem.init(image: UIImage(named: "icons8-rounded-square-30"), selectedImage: UIImage(named: ""))
        vc3.tabBarItem = ESTabBarItem.init(image: UIImage(named: "icons8-prize-30"), selectedImage: UIImage(named: ""))
        vc4.tabBarItem = ESTabBarItem.init(image: UIImage(named: "icons8-male-user-30"), selectedImage: UIImage(named: ""))

//        vc1.tabBarItem.badgeValue = "New"
//        vc2.tabBarItem.badgeValue = "99+"
//        vc3.tabBarItem.badgeValue = "1"

        viewControllers = [vc1, vc2, vc3, vc4]
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
