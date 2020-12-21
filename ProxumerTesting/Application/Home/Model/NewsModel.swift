import Foundation

struct NewsModel: Decodable {
    var header: String
    var image: [NewsImage]
}

struct NewsImage: Decodable {
    var image: String
}
