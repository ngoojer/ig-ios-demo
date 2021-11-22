import Foundation
import SwiftUI
import Combine

struct DetailView: View {
    @ObservedObject var viewModel: CellViewModel
    
    var body: some View {
        VStack {
            ScrollContent(viewModel: viewModel)
        }
        .navigationBarTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.large)
    }
    
    struct ScrollContent: View {
        let viewModel: CellViewModel
        private let placeholderImge = UIImage(named: "place")!
        
        var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .center, spacing: 20){
                    ImageView(avatarImage: viewModel.headlineImage ?? placeholderImge)
                    Text(viewModel.timeString).italic()
                    Text(viewModel.description)
                }.padding(.all, 10)
            }
        }
    }
    
    struct ImageView: View {
        let avatarImage: UIImage
        private let screenWidth = UIScreen.main.bounds.width
        
        var body: some View {
            Image(uiImage: avatarImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth - 20,
                       height: screenWidth * 0.5,
                       alignment: .center)
        }
    }
}



