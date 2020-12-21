import Foundation

struct GoalsViewModel {
    private var viewModel: GoalsModel

    init(viewModel: GoalsModel) {
        self.viewModel = viewModel
    }

    var planString: String {
        return viewModel.plan
    }

    var moneyString: String {
        return viewModel.money
    }

    var totalString: String {
        return viewModel.total
    }

    var statusString: String {
        return viewModel.status
    }

    var dayLeftString: String {
        return viewModel.dayleft
    }
}
