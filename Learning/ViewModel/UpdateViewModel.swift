import SwiftUI

// ViewModel to manage UpdateView's state and actions
class UpdateViewModel: ObservableObject {
    // Stores the user's learning goal data
    @Published var learningGoal: LearningGoalModel
    // Boolean flag to control navigation to HomeView
    @Published var navigateToHome: Bool = false

    // Initialize with default learning goal values
    init() {
        self.learningGoal = LearningGoalModel(learning: "", selectedOption: "Month")
    }
    
    // Update learning subject in the model
    func updateLearningGoal(_ newLearning: String) {
        learningGoal.learning = newLearning
    }
    
    // Update the selected learning duration option
    func updateSelectedOption(_ option: String) {
        learningGoal.selectedOption = option
    }
    
    // Trigger navigation to HomeView
    func startLearning() {
        navigateToHome = true
    }
}
