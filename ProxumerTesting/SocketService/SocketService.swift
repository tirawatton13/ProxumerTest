import Foundation
import RxSwift

protocol SocketServiceProtocol {
    func getUpdateSocketIO(completion: @escaping (SocketModel) -> Void, error: @escaping (String) -> Void)
}

class SocketService: SocketServiceProtocol {
    let socketIOManager: SocketManagerProtocol

    init(socketIOManager: SocketManagerProtocol = SocketIOManager()) {
        self.socketIOManager = socketIOManager
    }

    deinit {
        print("SocketIOService is Retain")
    }

    func getUpdateSocketIO(completion: @escaping (SocketModel) -> Void,
                      error: @escaping (String) -> Void) {
        socketIOManager.requestSocketEvents(req: SocketRequest()) { [weak self] result in
            switch result {
            case let .success(successResponse):
                completion(successResponse)
            case let .failure(serviceError):
                error(serviceError.localizedDescription)
            }
        }
    }
}
