
import SwiftUI

struct StatusBadgeView: View {

    let status: ServiceStatus

    var color: Color {
        switch status {
        case .planned: return .blue
        case .scheduled: return .green
        case .confirmed: return .purple
        case .approved: return .orange
        }
    }

    var body: some View {
        Text(status.rawValue.capitalized)
            .font(.caption)
            .padding(.horizontal,10)
            .padding(.vertical,4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(10)
    }
}
