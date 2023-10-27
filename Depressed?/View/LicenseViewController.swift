import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Version agai
        let license = textView.text
        textView.text = ""
        DispatchQueue.main.async {
            self.textView.text = license
        }
    }

}
