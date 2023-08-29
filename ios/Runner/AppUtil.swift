import Foundation

class AppUtil {
    static func date2FormatedInt64(date: Date?) -> Int64? {
        // if date is nil, return nil
        if date == nil {
            return nil
        }
        // if date is not nil, return the date as Int32
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: date!)
        return Int64(dateString)
    }
}