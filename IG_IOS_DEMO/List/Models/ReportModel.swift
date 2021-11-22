import Foundation

// MARK: - Response
struct Response: Codable {
    let topNews: [Report]
    enum CodingKeys: String, CodingKey {
        case topNews
    }
}

// MARK: - Report
struct Report: Codable {
    let title: String
    let description: String?
    let headlineImageUrl: String?
    let displayTimestamp, lastUpdatedTimestamp: Int
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case headlineImageUrl
        case displayTimestamp, lastUpdatedTimestamp
    }
}
