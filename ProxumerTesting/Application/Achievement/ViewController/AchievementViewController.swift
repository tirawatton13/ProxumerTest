import UIKit
import RxSwift
import RxCocoa

class AchievementViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let disposeBag = DisposeBag()

    private var viewModel: AchievementListViewModel!

    static func instantiate(viewModel: AchievementListViewModel) -> AchievementViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "AchievementViewController") as! AchievementViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCollectionViewCell()
        setupBinding()
        setupLayout()
    }

    private func setupNavigationBar() {
     
    }

    private func registerCollectionViewCell() {
        collectionView.register(UINib(nibName: "AchievementCollectionViewCell", bundle: .main),
                                forCellWithReuseIdentifier: AchievementCollectionViewCell.reuseIdentifier())
    }

    private func setupLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.frame.width / 3) - 16, height: (collectionView.frame.width / 3) - 16)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    private func setupBinding() {

        viewModel.fetchAchievementData()
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: AchievementCollectionViewCell.reuseIdentifier(),
                                              cellType: AchievementCollectionViewCell.self)) { index, viewModel, cell in
                cell.bind(with: viewModel)
            }
            .disposed(by: disposeBag)

        collectionView.rx.willDisplayCell
            .subscribe { cell, indexPath in
                cell.layer.borderWidth = 2
                cell.layer.borderColor = UIColor.red.cgColor
                cell.layer.cornerRadius = 8
            }
            .disposed(by: disposeBag)
    }
}
