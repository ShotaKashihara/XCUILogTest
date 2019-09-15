import Foundation

struct Analytics {
    static func logEvent(eventName: String, parameters: [String: Any]? = nil) {
        if ProcessInfo.processInfo.environment["TEST"] == "true" {
            LogRequest.send(log: Log(name: eventName))
        }
        //Analytics.logEvent(eventName: eventName, parameters: parameters)
    }
}
