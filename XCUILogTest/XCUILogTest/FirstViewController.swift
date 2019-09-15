import UIKit

final class FirstViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func welcome(_ sender: UIButton) {
        Analytics.logEvent(eventName: "welcome")
        let viewController = SecondViewController()
        present(viewController, animated: true, completion: nil)
    }
}
