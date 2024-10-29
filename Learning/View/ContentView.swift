import SwiftUI

// Main view of the app
struct ContentView: View {
    @StateObject private var viewModel = LearnerViewModel() // ViewModel for managing app state

    var body: some View {
        NavigationView {                           // Wraps content in a navigation view
            ZStack {                               // Stacks views on top of each other
                Color.black.edgesIgnoringSafeArea(.all) // Sets background color
                Image(.streak)                      // Displays streak image
                    .resizable()
                    .frame(width : 200 , height: 200)
                    .padding(.top , -350)

                VStack {
                    Text("Hello Learner!")           // Greeting text
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading , -140)
                        .padding(.top , -110)
                }

                VStack {
                    Text("This app will help you learn everyday") // Subtitle text
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading , -110)
                        .padding(.top , -60)
                }

                VStack {
                    Text("I want to learn ")         // Label for learning title
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading , -180)
                        .padding(.top , 70)
                    
                    TextField("Swift", text: $viewModel.learningModel.title) // TextField for learning title input
                        .foregroundColor(.gray)
                        .accentColor(.orange)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray).opacity(0.5), alignment: .bottom // Adds underline
                        )
                        .padding(.horizontal, 20)
                }

                VStack {
                    Text("I want to learn it in a") // Label for duration selection
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading , -180)
                        .padding(.top , 180)
                }

                // Button row for selecting learning duration
                HStack {
                    // Button to select "Week" option
                    Button(action: {
                        viewModel.updateLearningOption(option: "Week") // Update ViewModel with "Week"
                    }) {
                        Text("Week")
                            .fontWeight(viewModel.learningModel.selectedOption == "Week" ? .bold : .regular) // Highlight if selected
                            .frame(width: 50, height: 10)
                            .foregroundColor(viewModel.learningModel.selectedOption == "Week" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningModel.selectedOption == "Week" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    .padding(.leading, -90)

                    // Button to select "Month" option
                    Button(action: {
                        viewModel.updateLearningOption(option: "Month") // Update ViewModel with "Month"
                    }) {
                        Text("Month")
                            .fontWeight(viewModel.learningModel.selectedOption == "Month" ? .bold : .regular)
                            .frame(width: 60, height: 10)
                            .foregroundColor(viewModel.learningModel.selectedOption == "Month" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningModel.selectedOption == "Month" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)

                    // Button to select "Year" option
                    Button(action: {
                        viewModel.updateLearningOption(option: "Year") // Update ViewModel with "Year"
                    }) {
                        Text("Year")
                            .fontWeight(viewModel.learningModel.selectedOption == "Year" ? .bold : .regular)
                            .frame(width: 50, height: 10)
                            .foregroundColor(viewModel.learningModel.selectedOption == "Year" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningModel.selectedOption == "Year" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    .padding(.leading, 6)
                }

                // Start learning button
                Button(action: {
                    viewModel.startLearning() // Trigger navigation to HomeView
                }) {
                    HStack {
                        Text("Start")
                        Image(systemName: "arrow.right") // Arrow icon next to Start text
                            .foregroundColor(.black)
                    }
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 150, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                }
                .padding(.top, 450)
            }
            .background(NavigationLink(destination: HomeView(language: viewModel.learningModel.title), isActive: $viewModel.navigateToHome) { EmptyView() }) // Navigation link to HomeView
        }
        .navigationBarBackButtonHidden(true) // Hide the back button in navigation
    }
}

#Preview {
    ContentView()
}
