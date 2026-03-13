
import SwiftUI

struct PriorityIndicator: View {

    let priority: ServicePriority

    var color: Color {
        switch priority {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 10,height: 10)
    }
}
