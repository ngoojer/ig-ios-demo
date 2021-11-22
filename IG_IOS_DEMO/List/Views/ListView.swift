import SwiftUI

struct ListView : View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.displayData) { displayData in
                    NavigationLink(destination: DetailView(viewModel: displayData)) {
                        CellView(displayData: displayData)
                    }
                }.listStyle(PlainListStyle())
                .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
                })
            }
            .navigationBarTitle(Text("Top News"))
            .onLoad {
                self.viewModel.fetchData()
            }
        }
    }
}

#if DEBUG
struct RepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView(viewModel: .init())
    }
}
#endif
