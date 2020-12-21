import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.adjustsFontSizeToFitWidth = true
    }

    func bind(with viewModel: AchievementViewModel) {
        label.text = viewModel.displayTitle
        image.image = UIImage(named: viewModel.displayImage)
    }
}
