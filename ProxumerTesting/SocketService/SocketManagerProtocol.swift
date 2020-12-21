import Foundation

protocol SocketManagerProtocol {
    func requestSocketEvents<T: Requestable>(req: T, completionHandler: @escaping (Result<T.ResponseType>) -> Void)
}
