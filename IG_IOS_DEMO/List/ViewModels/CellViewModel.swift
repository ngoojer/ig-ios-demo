import Foundation
import Combine
import UIKit

class CellViewModel: Identifiable, ObservableObject {
    @Published public var headlineImage: UIImage?
    private let report: Report
    private var cancellable: AnyCancellable?
    
    public var title: String { report.title}
    public var description: String { report.description ?? ""}
    
    public var timeString: String {
        let date = Date(timeIntervalSince1970: TimeInterval(report.lastUpdatedTimestamp)/1000)
        return CellViewModel.dateFormatterLocal.string(from: date)
    }
    
    public init(data: Report) {
        self.report = data
        loadHeadlineImage()
    }
    
    private func loadHeadlineImage(){
        guard let strUrl = report.headlineImageUrl,
              let url = URL(string: strUrl) else { return }
        cancellable = ImageLoader.shared.loadImage(from: url)
            .sink(receiveValue: {[weak self] (image) in
                self?.headlineImage = image
            })
    }
}

extension CellViewModel {
    private static let dateFormatterServer: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    private static let dateFormatterLocal: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy hh:mm a"
        formatter.timeZone =  TimeZone.current
        return formatter
    }()
}
