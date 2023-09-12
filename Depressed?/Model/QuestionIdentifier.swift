public enum QuestionIdentifier: String {
    case losingInterest
    case feelingDepressed
    case troubleSleeping
    case feelingTired
    case poorAppetite
    case lowSelfEsteem
    case troubleConcentrating
    case slowOrFast

    ///  Thoughts to be better off dead or of hurting yourself.
    case feelingSuicidal

    /// The total amount of question identifiers.
    public static let count: Int = [
        losingInterest,
        feelingDepressed,
        troubleSleeping,
        feelingTired,
        poorAppetite,
        lowSelfEsteem,
        troubleConcentrating,
        slowOrFast,
        feelingSuicidal
        ].count
}
