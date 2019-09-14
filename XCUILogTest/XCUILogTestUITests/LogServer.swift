import Swifter

final class LogServer {
    static let shared = LogServer()
    let server: HttpServer
    var store: [Log] = []

    init() {
        self.server = HttpServer()
        server.post["/log"] = { [weak self] request in
            let log = try! JSONDecoder().decode(Log.self, from: Data(request.body))
            self?.store.append(log)
            return HttpResponse.ok(.text(#"{ "success": true }"#))
        }
    }

    func start() {
        guard !server.operating else {
            return
        }

        var port: in_port_t = 9000
        var waitingConnection = true
        while waitingConnection {
            do {
                try server.start(port, forceIPv4: true)
                print("Server has started ( port = \(try server.port()) ).")
                waitingConnection = false
            } catch {
                print("Server start error: \(error)")
                port += 1
            }
        }
        return
    }

    func stop() {
        server.stop()
        store.removeAll()
    }
}
