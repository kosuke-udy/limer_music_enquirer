import Foundation

class AppUtil {
    static func date2FormatedInt32(date: Date?) -> Int32? {
        // if date is nil, return nil
        if date == nil {
            return nil
        }
        // if date is not nil, return the date as Int32
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: date!)
        return Int32(dateString)
    }
}