import Foundation

struct LogRequest {
    static let port = UserDefaults.standard.object(forKey: "port") as! String

    static func send(log: Log) {
        let url = URL(string: "http://localhost:\(port)/log")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(log)
        URLSession.shared.dataTask(with: request).resume()
    }
}
