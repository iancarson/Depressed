import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Version again since it is a requirement for IOS >= 9 sinc
        let license = textView.text
        textView.text = ""
        DispatchQueue.main.async {
            self.textView.text = license
        }
    }

}
