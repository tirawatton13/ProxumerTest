import SocketIO
import Starscream

protocol Requestable {
    associatedtype ResponseType: Decodable
    var endpoint: URL { get }
    var event: SocketIOManager.Event { get }
}

extension Requestable {
    var endpoint: URL {
        return URL(string: C.socketIOEndpoint)!
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct SocketRequest: Requestable {
    typealias ResponseType = SocketModel

    var endpoint: URL {
        return URL(string: C.socketIOEndpoint)!
    }

    var event: SocketIOManager.Event {
        return .notification
    }
}

final class SocketIOManager: SocketManagerProtocol {

    private var socketManager: SocketManager!
    private var socket: SocketIOClient!

    fileprivate let decoder: JSONDecoder

    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    deinit {
        print("SocketIOManager is retain")
    }

    enum Event: String {
        case notification = "new-notification"
    }

    func requestSocketEvents<T: Requestable>(req: T, completionHandler: @escaping (Result<T.ResponseType>) -> Void) {
        setupSocket(socketURL: req.endpoint)
        socket.on(clientEvent: .connect) { [weak self] _, _ in
            print("socket connected")
            guard let self = self else { return }
            self.socket.emit(req.event.rawValue)
        }

        socket.on(req.event.rawValue) { [weak self] (data, _) in
            guard !data.isEmpty else {
                print("[SocketIO] \(req.event.rawValue) data empty")
                return
            }

            do {
                let decoded = try T.ResponseType(from:  data[0])
                completionHandler(Result.success(decoded))
            } catch {
                completionHandler(Result.failure(error))
            }
        }
    }

    private func setupSocket(socketURL: URL)  {
        self.socketManager = SocketManager(socketURL: socketURL)
        self.socket = self.socketManager.defaultSocket

        self.socket.connect()
    }
}
