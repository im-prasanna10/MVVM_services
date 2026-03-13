
import Foundation
import Combine

final class ServicesViewModel: ObservableObject {

    @Published var services: [Service] = []
    @Published var filteredServices: [Service] = []
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadMockData()
        configureSearch()
    }

    private func configureSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.filterServices(value)
            }
            .store(in: &cancellables)
    }

    private func filterServices(_ text: String) {
        guard !text.isEmpty else {
            filteredServices = services
            return
        }

        let lower = text.lowercased()

        filteredServices = services.filter {
            $0.title.lowercased().contains(lower) ||
            $0.customerName.lowercased().contains(lower) ||
            $0.description.lowercased().contains(lower)
        }
    }

    @MainActor
    func refresh() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        loadMockData()
    }

    private func loadMockData() {
        services = [
            Service(
                title: "Office Space Revamp",
                customerName: "XYZ Industries",
                description: "Transform your office with sleek furnishings.",
                notes: "Confirm furniture layout before renovation.",
                date: Date(),
                status: .planned,
                priority: .high,
                latitude: 47.6062,
                longitude: -122.3321
            ),
            Service(
                title: "Modern Workspace Makeover",
                customerName: "Acme Corp",
                description: "Revitalize workspace with modern decor.",
                notes: "Coordinate with interior design team.",
                date: Date().addingTimeInterval(3600),
                status: .scheduled,
                priority: .medium,
                latitude: 47.6062,
                longitude: -122.3321
            )
        ]

        filteredServices = services
    }
}
