import UIKit

/// Types conforming to t
public protocol SettingsProtocol: class {
    var numberOfFinishedSurveys: Int { get set }
 
    var didShowRatingPrompt: Bool { get set }

    func incrementNumberOfFinishedSurveys()
}

class Settings: SettingsProtocol {
    private let finishedSurveysUserDefaultsKey = "finishedSurveys"
    private let didShowRatingUserDefaultsKey = "didShowRatingPrompt"

    var numberOfFinishedSurveys: Int {
        get {
            return UserDefaults.standard.integer(forKey: finishedSurveysUserDefaultsKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: finishedSurveysUserDefaultsKey)
        }
    }

    var didShowRatingPrompt: Bool {
        get {
            return UserDefaults.standard.bool(forKey: didShowRatingUserDefaultsKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: didShowRatingUserDefaultsKey)
        }
    }

    func incrementNumberOfFinishedSurveys() {
        numberOfFinishedSurveys += 1
    }
}
