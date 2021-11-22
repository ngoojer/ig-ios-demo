import Foundation
import Combine

protocol FxServiceProtocol {
    var networkService: NetworkServiceProtocol { get }
    func fetchReports() -> AnyPublisher<Response, Error>
}

struct FxService: FxServiceProtocol {
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchReports() -> AnyPublisher<Response, Error> {
        let endpoint = Endpoint.report()
        return networkService
            .get(type: Response.self, url: endpoint.url, header: nil)
    }
}
