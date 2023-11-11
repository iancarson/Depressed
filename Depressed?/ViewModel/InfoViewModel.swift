import Foundation

public struct InfoViewModel {

    public let versionInformation: String = {

        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return "\(version) (\(buildNumber))"
        }

        return ""
    }()

    ///  C
    public init() {}

}
