import Foundation
import RxSwift

protocol AchievementServiceProtocol {
    func fetchAchievementData() -> Observable<[AchievementModel]>
}

class AchievementService: AchievementServiceProtocol {

    enum Resource: String {
        case achievement = "achievements"
    }

    func fetchAchievementData() -> Observable<[AchievementModel]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "achievements", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONDecoder().decode([AchievementModel].self, from: data)
                observer.onNext(json)
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }

            return Disposables.create { }
        }
    }
}
