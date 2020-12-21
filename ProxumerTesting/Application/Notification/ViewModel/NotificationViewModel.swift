import Foundation

struct NotificationViewModel {
    private let message: SocketModel

    init(message: SocketModel) {
        self.message = message
    }

    func counterBadge() -> String {
        return message.message
    }
}
