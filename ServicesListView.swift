
import SwiftUI

struct ServicesListView: View {

    @StateObject private var viewModel = ServicesViewModel()

    var body: some View {

        NavigationStack {

            List(viewModel.filteredServices) { service in

                NavigationLink {
                    ServiceDetailView(service: service)
                } label: {
                    ServiceRowView(service: service)
                }
            }
            .navigationTitle("Services")
            .searchable(text: $viewModel.searchText)
            .refreshable {
                await viewModel.refresh()
            }
        }
    }
}
