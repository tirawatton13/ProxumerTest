import UIKit

class GoalsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dayLeft: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }

    func binding(for viewModel: GoalsModel) {
        imageView.image = UIImage(named: viewModel.image)
        valueLabel.text = "\(viewModel.money) บาท"
        totalLabel.text = "\(viewModel.total) บาท"
        headerLabel.text = viewModel.plan
        statusLabel.text = viewModel.status
        dayLeft.text = "\(viewModel.dayleft) days left"
    }

    private func setupLabel() {
        valueLabel.adjustsFontSizeToFitWidth = true
        totalLabel.adjustsFontSizeToFitWidth = true
        headerLabel.adjustsFontSizeToFitWidth = true
        statusLabel.adjustsFontSizeToFitWidth = true
        dayLeft.adjustsFontSizeToFitWidth = true
    }
}
