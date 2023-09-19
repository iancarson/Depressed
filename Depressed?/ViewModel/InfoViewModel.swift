import Foundation

public struct InfoViewModel {

    /// The current version 
    public let versionInformation: String = {

        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return "\(version) (\(buildNumber))"
        }

        return ""
    }()

    ///  Creates a new `InfoViewModel`.
    ///
    ///  - returns: a new `InfoViewModel` instance.
    public init() {}

}
