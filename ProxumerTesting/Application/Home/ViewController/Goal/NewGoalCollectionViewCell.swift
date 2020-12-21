import UIKit

class NewGoalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.init(red: 0.712, green: 0.378, blue: 0.298, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
    }
}
