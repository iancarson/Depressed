import UIKit

@IBDesignable
class ShadowLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpShadow()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpShadow()
    }

    override func prepareForInterfaceBuilder() {
        setUpShadow()
    }

    private func setUpShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shouldRasterize = true
    }
}
