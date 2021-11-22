//https://content.dailyfx.com/api/v1/dashboard?
import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "content.dailyfx.com"
        components.path = "/api/v1" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}

extension Endpoint {
    static func report() -> Self {
        return Endpoint(path: "/dashboard")
    }
}
