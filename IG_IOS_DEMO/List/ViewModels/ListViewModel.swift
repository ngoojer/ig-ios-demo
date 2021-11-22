import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published public var displayData: [CellViewModel] = []
    @Published public var isErrorShown = false
    @Published public var errorMessage = ""
    
    private var searchCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
    public var fxService: FxServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(fxService: FxServiceProtocol = FxService()) {
        self.fxService = fxService
        _ = NetworkMonitor.shared
    }
    
    public func fetchData() {
        fxService.fetchReports()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self.isErrorShown = true
                    self.errorMessage = error.localizedDescription
                    self.displayData = []
                case .finished: break
                }
            } receiveValue: { [weak self] response in
                self?.displayData = response.topNews.map { CellViewModel(data: $0)}
                print("Result count = \(response.topNews.count)")
            }
            .store(in: &cancellables)
    }
}
