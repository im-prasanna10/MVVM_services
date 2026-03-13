
import SwiftUI

struct ServiceRowView: View {

    let service: Service

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(service.title)
                    .font(.headline)

                Spacer()

                PriorityIndicator(priority: service.priority)
            }

            Text(service.customerName)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(service.description)
                .font(.caption)

            HStack {
                StatusBadgeView(status: service.status)
                Spacer()
                Text(service.date.smartFormat())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical,6)
    }
}
