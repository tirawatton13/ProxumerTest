import UIKit

class NewGoalViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    private var collectionViewModel: [CollectionViewModel] {
        let model = CollectionViewModel(title: "Travel", image: "luggage")
        let model1 = CollectionViewModel(title: "Education", image: "education")
        let model2 = CollectionViewModel(title: "Invest", image: "investment")
        let model3 = CollectionViewModel(title: "Clothing", image: "jersey")
        let model4 = CollectionViewModel(title: "Education", image: "education")

        return [model, model1, model2, model3, model4]
    }

    static func instantiate() -> NewGoalViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "NewGoalViewController") as! NewGoalViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonStyle()
        setupCollectionViewCell()
        setupLayout()
    }

    private func setupCollectionViewCell() {
        collectionView.register(UINib(nibName: "NewGoalCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: NewGoalCollectionViewCell.reuseIdentifier())
    }

    private func setupLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.frame.width / 3) - 32, height: (collectionView.frame.width / 3) - 32)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    private func setupButtonStyle() {
        let buttonsArray = [addButton, cancelButton]
        for button in buttonsArray {
            button?.layer.cornerRadius = 4
            button?.layer.borderWidth = 2
            button?.layer.borderColor = UIColor.init(red: 193, green: 91, blue: 70, alpha: 1).cgColor
            button?.layer.masksToBounds = true
        }
    }
    
    @IBAction func cancelHandle(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NewGoalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewGoalCollectionViewCell.reuseIdentifier(), for: indexPath) as? NewGoalCollectionViewCell else { return UICollectionViewCell()
        }

        let imageString = collectionViewModel[indexPath.row].image
        let titleString = collectionViewModel[indexPath.row].title

        cell.imageView.image = UIImage(named: imageString)
        cell.titleLabel.text = titleString

        return cell
    }
}


