import SwiftUI

// Main update view for setting learning goals and options
struct UpdateView: View {
    @StateObject private var viewModel = UpdateViewModel() // ViewModel instance to manage state

    var body: some View {
        NavigationView { // Wraps content in a navigation view
            ZStack { // Overlays views on top of each other
                Color.black.edgesIgnoringSafeArea(.all) // Sets background color for the entire screen
                
                // Header title
                VStack {
                    Text("Learning goal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 750)
                }
                
                // Back button
                Button(action: {
                    viewModel.startLearning() // Calls ViewModel to handle navigation
                }) {
                    Image(systemName: "chevron.left") // Icon for back
                        .foregroundColor(.orange)
                    Text("Back") // Back button text
                        .foregroundColor(.orange)
                }
                .padding(.bottom, 750)
                .padding(.trailing, 330)

                // Update button
                Button(action: {
                    viewModel.startLearning() // ViewModel handles navigation action
                }) {
                    Text("Update") // Update button text
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                .padding(.bottom, 750)
                .padding(.leading, 280)
                
                VStack {
                    // Label for learning subject
                    Text("I want to learn")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, -180)
                    
                    // TextField to input learning subject
                    TextField("Swift", text: $viewModel.learningGoal.learning)
                        .foregroundColor(.gray)
                        .accentColor(.orange)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray).opacity(0.5), alignment: .bottom // Adds underline
                        )
                        .padding(.horizontal, 20)
                }
                .padding(.top, -330)
                
                VStack {
                    // Label for selecting learning duration
                    Text("I want to learn it in a")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading, -180)
                        .padding(.top, -250)
                }
                
                // Button group for selecting duration options
                HStack {
                    // Week option button
                    Button(action: {
                        viewModel.updateSelectedOption("Week") // Updates selected option to Week
                    }) {
                        Text("Week")
                            .fontWeight(viewModel.learningGoal.selectedOption == "Week" ? .bold : .regular)
                            .frame(width: 50, height: 10)
                            .foregroundColor(viewModel.learningGoal.selectedOption == "Week" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningGoal.selectedOption == "Week" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    .padding(.leading, -90)
                    
                    // Month option button
                    Button(action: {
                        viewModel.updateSelectedOption("Month") // Updates selected option to Month
                    }) {
                        Text("Month")
                            .fontWeight(viewModel.learningGoal.selectedOption == "Month" ? .bold : .regular)
                            .frame(width: 60, height: 10)
                            .foregroundColor(viewModel.learningGoal.selectedOption == "Month" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningGoal.selectedOption == "Month" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    
                    // Year option button
                    Button(action: {
                        viewModel.updateSelectedOption("Year") // Updates selected option to Year
                    }) {
                        Text("Year")
                            .fontWeight(viewModel.learningGoal.selectedOption == "Year" ? .bold : .regular)
                            .frame(width: 50, height: 10)
                            .foregroundColor(viewModel.learningGoal.selectedOption == "Year" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningGoal.selectedOption == "Year" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    .padding(.leading, 6)
                }
                .padding(.top, -480)
                .padding(.leading, 30)
            }
            // Background navigation link to HomeView when navigation is triggered
            .background(NavigationLink(destination: HomeView(language: viewModel.learningGoal.learning), isActive: $viewModel.navigateToHome) { EmptyView() })
        }
        .navigationBarBackButtonHidden(true) // Hides the default back button
    }
}

#Preview {
    UpdateView()
}
