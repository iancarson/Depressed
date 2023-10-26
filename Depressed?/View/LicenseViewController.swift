import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // but on iOS >= 9 t
        let license = textView.text
        textView.text = ""
        DispatchQueue.main.async {
            self.textView.text = license
        }
    }

}
