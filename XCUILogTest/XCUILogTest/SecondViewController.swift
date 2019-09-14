import UIKit

final class SecondViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func signUp(_ sender: UIButton) {
        LogRequest.send(log: Log(name: "sign up"))
    }
    @IBAction func signIn(_ sender: UIButton) {
        LogRequest.send(log: Log(name: "sign in"))
    }
}
