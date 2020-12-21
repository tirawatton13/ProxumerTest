import Foundation
import SocketIO

class NotificationListViewModel {

    private let socketService: SocketServiceProtocol
    private var socketModel: SocketModel?

    init(socketService: SocketServiceProtocol = SocketService()) {
        self.socketService = socketService
    }

    func getUpdateSocketIO(_ completion: @escaping ((SocketModel) -> Void)) {
        socketService.getUpdateSocketIO { [weak self] result in
            completion(result)
            self?.socketModel = result
        } error: { _ in }
    }

    func counterBadge() -> String {
        return socketModel?.message ?? ""
    }
}
