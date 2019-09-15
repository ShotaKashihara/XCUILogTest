import XCTest

final class XCUILogTestUITests: XCTestCase {
    private let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        LogServer.shared.start()
        let port = try! LogServer.shared.server.port()
        app.launchArguments.append(contentsOf: ["-port", "\(port)"])
        app.launchEnvironment["TEST"] = "true"
        app.launch()
    }

    override func tearDown() {
        LogServer.shared.stop()
    }

    func testSignInLog() {
        app.buttons["welcome"].tap()
        app.buttons["sign in"].tap()
        sleep(1)
        let log = LogServer.shared.store
        XCTAssertEqual(log.filter { $0.name == "welcome" }.count, 1)
        XCTAssertEqual(log.filter { $0.name == "sign_in" }.count, 1)
        XCTAssertEqual(log.filter { $0.name == "sign_up" }.count, 0)
    }

    func testSignUpLog() {
        app.buttons["welcome"].tap()
        app.buttons["sign up"].tap()
        sleep(1)
        let log = LogServer.shared.store
        XCTAssertEqual(log.filter { $0.name == "welcome" }.count, 1)
        XCTAssertEqual(log.filter { $0.name == "sign_up" }.count, 1)
        XCTAssertEqual(log.filter { $0.name == "sign_in" }.count, 0)
    }
}

