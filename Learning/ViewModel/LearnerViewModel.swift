import SwiftUI
import Combine

// ViewModel class for managing learning data and navigation
class LearnerViewModel: ObservableObject {
    
    // Holds data for learning model
    @Published var learningModel: LearningModel
    // State to track navigation to HomeView
    @Published var navigateToHome: Bool = false
    
    // Initialize with default learning model values
    init() {
        self.learningModel = LearningModel(title: "", selectedOption: "Month")
    }
    
    // Update learning option (e.g., Week, Month, Year)
    func updateLearningOption(option: String) {
        learningModel.selectedOption = option
    }
    
    // Set navigateToHome to true to start navigation
    func startLearning() {
        navigateToHome = true
    }
}
