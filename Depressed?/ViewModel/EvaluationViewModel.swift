import Foundation

public struct EvaluationViewModel {

    public let diagnosis: String

    public let diagnosisText: String
    public let explanationText: String

    /// Warning message in case the user answered that they had thoughts
    /// about suicide or self harm.
    public let suicidalText: String?

    public let score: String

    /// If a depressive disorder is not
    public let shouldDisplayScore: Bool

    /// The titles of the questions the user has answered and the corresponding score.
    public let answers: [(String, String)]

    public let findingHelpViewModel: FindingHelpViewModel?

    public var shouldDisplayFindingHelpInformation: Bool {
        return findingHelpViewModel != nil
    }

    /// Whether or not the user should be prompted to rate the app or leav 
    public var shouldPromptForReview: Bool {

        if ProcessInfo.processInfo.environment["UITests"]?.isEmpty == false {
            return false
        }

        return settings.didShowRatingPrompt == false && settings.numberOfFinishedSurveys > 1
    }

    private let settings: SettingsProtocol

    ///  Creates a new view model from the given evaluation.
    ///  - returns: a newly initialized `EvaluationViewModel` instance
    public init(evaluation: EvaluationType, findingHelpInformation: FindingHelpInformation?, settings: SettingsProtocol) {

        self.settings = settings

        if let findingHelpInformation = findingHelpInformation {
            findingHelpViewModel = FindingHelpViewModel(info: findingHelpInformation)
        } else {
            findingHelpViewModel = nil
        }

        if evaluation.depressiveDisorderConsidered {

            explanationText = NSLocalizedString("explanation_depression", comment: "")

            switch evaluation.severity {
            case .noDepression:
                diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")
            case .minimalDepression:
                diagnosis = NSLocalizedString("diagnosis_minimal_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_minimal_depression", comment: "")
            case .mildDepression:
                diagnosis = NSLocalizedString("diagnosis_mild_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_mild_depression", comment: "")
            case .moderateDepression:
                diagnosis = NSLocalizedString("diagnosis_moderate_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderate_depression", comment: "")
            case .moderatelySevereDepression:
                diagnosis = NSLocalizedString("diagnosis_moderately_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderately_severe_depression", comment: "")
            case .severeDepression:
                diagnosis = NSLocalizedString("diagnosis_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_severe_depression", comment: "")
            }
        } else {
            diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
            diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")

            if evaluation.numberOfAnswersCritical {
                explanationText = NSLocalizedString("explanation_no_depression_first_questions_not_critical", comment: "")
            } else {
                explanationText = NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
            }
        }

        if evaluation.suicidal {
            suicidalText = NSLocalizedString("suicidal_text", comment: "")
        } else {
            suicidalText = nil
        }

        shouldDisplayScore = evaluation.depressiveDisorderConsidered

        score = String(evaluation.score)

        answers = evaluation.answers.map { ($0.question.title, String($0.answerScore.rawValue)) }
    }

    /// Called when the viewController asked the system to request a review from the user
    public func didShowReviewPrompt() {
        settings.didShowRatingPrompt = true
    }

}
