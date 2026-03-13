
import Foundation

extension Date {

    func smartFormat() -> String {
        let calendar = Calendar.current

        if calendar.isDateInToday(self) {
            return "Today, \(timeFormat())"
        }

        if calendar.isDateInTomorrow(self) {
            return "Tomorrow, \(timeFormat())"
        }

        if calendar.isDateInYesterday(self) {
            return "Yesterday, \(timeFormat())"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, h:mm a"
        return formatter.string(from: self)
    }

    private func timeFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
}
