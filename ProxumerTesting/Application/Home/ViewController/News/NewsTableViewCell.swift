import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerLabel: UILabel!

    var imageModel: [NewsImage]?

    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
        setupLayout()
    }

    private func registerCollectionViewCell() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: NewsCollectionViewCell.reuseIdentifier())
    }

    private func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (self.frame.width/1.25), height: collectionView.frame.height - 32)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension NewsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = imageModel?.count else { return 0 }
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseIdentifier(), for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        if let image = imageModel?[indexPath.item] {
            cell.binding(for: image)
        }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
}
