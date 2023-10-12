import ResearchKit

public struct Answer {

    /// The answered 
    public let question: Question
    public let answerScore: PHQ9ChoiceValue
    
    public init?(stepResult: ORKStepResult) {
        guard let result = stepResult.firstResult as? ORKChoiceQuestionResult,
            let value = result.choiceAnswers?.first as? NSNumber,
            let score = PHQ9ChoiceValue(rawValue: value.intValue),
            let identifier = QuestionIdentifier(rawValue: stepResult.identifier) else { return nil }

        answerScore = score

        question = Question(identifier: identifier)
    }
}
