import Foundation
import SwiftUI

struct CellView: View {
    @ObservedObject private var viewModel: CellViewModel
    private let placeholderImge = UIImage(named: "place")!
    
    public init(displayData: CellViewModel) {
        self.viewModel = displayData
    }
    
    var body: some View {
        HStack (spacing: 16) {
            ImageView(avatarImage: viewModel.headlineImage ?? placeholderImge)
            VStack (alignment: .leading, spacing: 8) {
                Text(viewModel.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(viewModel.description)
                    .font(.subheadline)
            }
            .frame(height: 85)
        }
    }
    
    struct ImageView: View {
        public let avatarImage: UIImage
        private let screenWidth = UIScreen.main.bounds.width
        
        var body: some View {
            Image(uiImage: avatarImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth * 0.2,
                       height: screenWidth * 0.2,
                       alignment: .center)
                .clipped()
                .cornerRadius(5)
        }
    }
}
