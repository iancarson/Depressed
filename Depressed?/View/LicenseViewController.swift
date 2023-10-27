import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // but on iOS
        let license = textView.text
        textView.text = ""
        DispatchQueue.main.async {
            self.textView.text = license
        }
    }

}
