import Foundation
import RxSwift

final class AchievementListViewModel {
    private let service: AchievementServiceProtocol

    init(service: AchievementServiceProtocol = AchievementService()) {
        self.service = service
    }

    func fetchAchievementData() -> Observable<[AchievementViewModel]> {
        service.fetchAchievementData().map { $0.map {
            AchievementViewModel(model: $0)
        } }
    }
}
