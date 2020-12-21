import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var newsModel: [NewsModel] {
        let image1 = NewsImage(image: "sale")
        let image2 = NewsImage(image: "sale")
        let image3 = NewsImage(image: "sale")

        let model = NewsModel(header: "Best Offer", image: [image1, image2, image3])
        let model1 = NewsModel(header: "Suggest For You", image: [image1, image2, image3])
        return [model, model1]
    }

    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()

    }

    private func setupTableViewCell() {
        tableView.register(UINib(nibName: "GoalsTableViewCell", bundle: .main), forCellReuseIdentifier: GoalsTableViewCell.reuseIdentifier())
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: .main), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier())
    }

    func navigateToAddNewGola() {
        let viewController = NewGoalViewController.instantiate()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return newsModel.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GoalsTableViewCell.reuseIdentifier(), for: indexPath) as? GoalsTableViewCell else { return UITableViewCell()
            }

            cell.navigateToNewGoal = navigateToAddNewGola

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier(), for: indexPath) as? NewsTableViewCell else { return UITableViewCell()
            }
            cell.headerLabel.text = newsModel[indexPath.row].header
            cell.imageModel = newsModel[indexPath.row].image

            return cell
        default:
            return UITableViewCell()
        }
    }
}
