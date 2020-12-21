import Foundation

struct NewsViewModel {
    var viewModel: NewsModel

    init(viewModel: NewsModel) {
        self.viewModel = viewModel
    }

    var headerString: String {
        return viewModel.header
    }
}
