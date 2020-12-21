import Foundation

struct AchievementViewModel {
    private var model: AchievementModel

    init(model: AchievementModel) {
        self.model = model
    }

    var displayTitle: String {
        return model.title
    }

    var displayImage: String {
        return model.image
    }
}
