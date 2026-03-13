
import Foundation

enum ServiceStatus: String {
    case planned
    case scheduled
    case confirmed
    case approved
}

enum ServicePriority {
    case low
    case medium
    case high
}

struct Service: Identifiable {
    let id = UUID()
    let title: String
    let customerName: String
    let description: String
    let notes: String
    let date: Date
    let status: ServiceStatus
    let priority: ServicePriority
    let latitude: Double
    let longitude: Double
}
