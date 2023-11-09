import Foundation

public struct FindingHelpViewModel {

    public let url: URL

    public let credits: String

    /
    public init(info: FindingHelpInformation) {
        url = info.url as URL
        credits = String(format: NSLocalizedString("find_help_credits_format", comment: ""), info.organizationName)
    }
}
