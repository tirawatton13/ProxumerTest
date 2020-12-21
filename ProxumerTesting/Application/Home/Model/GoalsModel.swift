import Foundation

struct GoalsModel {
    var image: String
    var money: String
    var total: String
    var plan: String
    var status: String
    var dayleft: String

    init(image: String, money: String, total: String, plan: String, status: String, dayleft: String) {
        self.image = image
        self.money = money
        self.total = total
        self.plan = plan
        self.status = status
        self.dayleft = dayleft
    }
}
