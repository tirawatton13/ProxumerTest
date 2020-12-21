import UIKit

class GoalsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var savingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var addNewGoalButton: UIButton!

    var goalModel: [GoalsModel] {
        let model = GoalsModel(image: "luggage", money: "16,500", total: "20,000", plan: "เที่ยวญี่ปุ่น", status: "Good", dayleft: "45")
        let model1 = GoalsModel(image: "investment", money: "400", total: "500", plan: "กองทุนรวม", status: "Good", dayleft: "23")
        let model2 = GoalsModel(image: "luggage", money: "13,000", total: "20,000", plan: "เที่ยวญี่ปุ่น", status: "Good", dayleft: "31")
        return [model, model1, model2]
    }

    var navigateToNewGoal: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupButtonStyle()
        registerCollectionViewCell()

        totalLabel.text = "\(goalModel.count) Goals"
    }

    private func setupButtonStyle() {
        addNewGoalButton.layer.cornerRadius = 8
        addNewGoalButton.layer.masksToBounds = true
    }

    private func registerCollectionViewCell() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GoalsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: GoalsCollectionViewCell.reuseIdentifier())
    }

    @IBAction func navigateToNewGoalNav(_ sender: UIButton) {
        self.navigateToNewGoal?()
    }
}

extension GoalsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) , height: collectionView.frame.height - 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}

extension GoalsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goalModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalsCollectionViewCell.reuseIdentifier(), for: indexPath) as? GoalsCollectionViewCell else { return UICollectionViewCell() }
        let data = goalModel[indexPath.row]
        cell.binding(for: data)
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

