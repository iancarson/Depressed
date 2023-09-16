import ResearchKit

/// Task that contains the questions of the [PHQ-9](https://en.wikipedia.org/wiki/Patient_Health_Questionnaire#Versions) questionnaire.
open class SelfTestTask: ORKOrderedTask {
    ///  - returns: a newly initialized `SelfTestTask` instance.
    public class func task() -> SelfTestTask {
        let steps = [
            Question(identifier: .losingInterest),
            Question(identifier: .feelingDepressed),
            Question(identifier: .troubleSleeping),
            Question(identifier: .feelingTired),
            Question(identifier: .poorAppetite),
            Question(identifier: .lowSelfEsteem),
            Question(identifier: .troubleConcentrating),
            Question(identifier: .slowOrFast),
            Question(identifier: .feelingSuicidal)
            ].map { $0.step }

        return SelfTestTask(identifier: "SelfTest", steps: steps)
    }
    ///  - parameter result: The current task result.
    ///
    ///  - returns: The progress of the current step.
    open override func progress(ofCurrentStep step: ORKStep, with result: ORKTaskResult) -> ORKTaskProgress {
        let index = steps.index(of: step)

        if let index = index {
            return ORKTaskProgress(current: UInt(index), total: UInt(steps.count))
        }

        return ORKTaskProgress(current: 0, total: UInt(steps.count))
    }

}
