import UIKit
import RxCocoa
import RxSwift

class NotificationViewController: BaseViewController {

    private var viewModel: NotificationListViewModel!

    static func instantiate(viewModel: NotificationListViewModel) -> NotificationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "NotificationViewController") as! NotificationViewController
        viewController.viewModel = viewModel
        return viewController
    }

    var counterBadge: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUpdateSocketIO { [weak self] result in
            self?.counterBadge += 1
            self?.tabBarItem.badgeValue = "\((self?.counterBadge)!)"
        }
    }
}
