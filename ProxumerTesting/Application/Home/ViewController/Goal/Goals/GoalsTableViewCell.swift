import UIKit

class GoalsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var newGoalButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
        setupLayout()
        setupButtonStyle()
    }

    private func setupButtonStyle() {
        newGoalButton.layer.cornerRadius = 8
        newGoalButton.layer.masksToBounds = true
    }

    private func registerCollectionViewCell() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GoalsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: GoalsCollectionViewCell.reuseIdentifier())
    }

    private func setupLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.width/3 + 16, height: collectionView.frame.height)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension GoalsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalsCollectionViewCell.reuseIdentifier(), for: indexPath) as? GoalsCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 2

        if indexPath.row % 2 == 0 {
            cell.layer.borderColor = UIColor.green.cgColor
        } else {
            cell.layer.borderColor = UIColor.red.cgColor
        }

        return cell
    }


}
