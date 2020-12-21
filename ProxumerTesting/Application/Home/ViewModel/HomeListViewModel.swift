import Foundation
import RxSwift

//class HomeListViewModel {
//    private var service: FeedHomeServiceProtocol
//    
//    init(service: FeedHomeServiceProtocol = FeedHomeService()) {
//        self.service = service
//    }
//    
//    func fetchGoalsData() -> Observable<[GoalsViewModel]> {
//        service.fetchGoalsData().map { $0.map {
//            GoalsViewModel(viewModel: $0)
//        }}
//    }
//
//    func fetchNewsData() -> Observable<[NewsViewModel]> {
//        service.fetchNewsData().map { $0.map {
//            NewsViewModel(viewModel: $0)
//        }}
//    }
//    
//}
