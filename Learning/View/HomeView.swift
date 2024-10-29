import SwiftUI

// Main Home View struct
struct HomeView: View {
    var language: String                          // The language being learned
    @StateObject private var viewModel = HomeViewModel()  // ViewModel instance for managing data

    // Main body of the view
    var body: some View {
        NavigationView {                           // Navigation view for the screen
            ZStack {                               // Stack views on top of each other
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {                          // Vertical stack for title and date
                    Text("\(formattedDate())")      // Display formatted current date
                        .foregroundColor(Color.gray)
                        .fontWeight(.regular)
                        .padding(.leading, -180)
                        .padding(.top, -355)
                    
                    Text("Learning \(language)")    // Display the language being learned
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, -180)
                        .padding(.top, -330)
                }

                // Button to navigate to UpdateView screen
                NavigationLink(destination: UpdateView()) {
                    Image(.streak)                 // Streak icon image
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(.leading, 300)
                        .padding(.bottom, 610)
                }
                
                VStack {                           // VStack for date navigation and weekly display
                    HStack {                       // HStack for month and navigation buttons
                        Text(monthYearString(for: viewModel.selectedDate)) // Display month and year
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        // Button to navigate to the next month
                        Button(action: {
                            viewModel.selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: viewModel.selectedDate)!
                        }) {
                            Image(systemName: "chevron.right") // Right arrow icon
                                .foregroundColor(.orange)
                        }
                        .padding(.leading, -200)
                        
                        HStack {
                            // Button to navigate to previous week
                            Button(action: {
                                viewModel.selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: viewModel.selectedDate)!
                            }) {
                                Image(systemName: "chevron.left") // Left arrow icon
                                    .foregroundColor(.orange)
                            }
                            
                            // Button to navigate to next week
                            Button(action: {
                                viewModel.selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: viewModel.selectedDate)!
                            }) {
                                Image(systemName: "chevron.right") // Right arrow icon
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding()
                    
                    HStack(spacing: 20) {          // Display days of the week
                        ForEach(0..<7) { day in
                            VStack {
                                Text(getDayOfWeek(day: day)) // Display weekday abbreviation
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    let daysOfWeek = viewModel.generateDaysForWeek(for: viewModel.selectedDate) // Generate week days
                    let columns = Array(repeating: GridItem(.flexible()), count: 7) // Set 7 flexible columns
                    
                    // Grid layout for displaying each day in the week
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(daysOfWeek, id: \.self) { day in
                            VStack {
                                Text(dayFormatter.string(from: day)) // Display day number
                                    .frame(width: 40, height: 40)
                                    .background(viewModel.isToday(date: day) ? viewModel.circleColor : Color.clear) // Set background color for today
                                    .cornerRadius(50)
                                    .foregroundColor(viewModel.isFuture(date: day) ? Color.gray : Color.white) // Gray out future dates
                                    .onTapGesture {
                                        if !viewModel.isFuture(date: day) {
                                            viewModel.selectedDate = day // Update selected date
                                        }
                                    }
                            }
                            .disabled(viewModel.isFuture(date: day)) // Disable future dates
                        }
                    }
                    
                    // Separator line
                    Rectangle()
                        .frame(width: 380, height: 1)
                        .foregroundColor(.gray)
                    
                    HStack { // Display streak and freezes used count
                        VStack(alignment: .leading) {
                            Text("   🔥 \(viewModel.homeModel.streak)") // Display streak count with fire emoji
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                            Text("Day streak")
                                .foregroundColor(.gray)
                        }.padding(.trailing, 40)
                        
                        // Vertical separator line
                        Rectangle()
                            .frame(width: 1, height: 65)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                        
                        VStack(alignment: .leading) {
                            Text("    ❄️ \(viewModel.homeModel.freezesUsed)") // Display freezes used with snowflake emoji
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("Day frozen")
                                .foregroundColor(.gray)
                        }.padding(.leading, 10)
                        .padding()
                    }.padding(.leading, 20)
                }
                .background(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 1)) // Add white border
                .cornerRadius(20)
                .padding(.top, -260)
                
                // Button for logging learned or freezing day
                VStack {
                    Button(action: {
                        if viewModel.homeModel.freezeLearned {
                            viewModel.resetFreeze() // Reset freeze if frozen
                        } else {
                            viewModel.logTodayAsLearned() // Log today as learned
                        }
                    }) {
                        Text(viewModel.homeModel.freezeLearned ? "Day Frozen" : (viewModel.homeModel.todayLearned ? "Learned Today" : "Log today as Learned"))
                            .font(.title2)
                            .bold()
                            .frame(width: 250, height: 250)
                            .background(viewModel.homeModel.freezeLearned ? Color.blue.opacity(0.4) : (viewModel.homeModel.todayLearned ? Color.orange.opacity(0.4) : Color.orange)) // Background color for states
                            .cornerRadius(125)
                            .foregroundColor(viewModel.homeModel.todayLearned || viewModel.homeModel.freezeLearned ? Color.black : Color.black) // Text color
                    }
                    .padding(.top, 290)
                }
                
                // Button for freezing the day
                VStack {
                    Button(action: {
                        viewModel.freezeDay() // Freeze the day if allowed
                    }) {
                        Text("Freeze day")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(viewModel.homeModel.todayLearned || viewModel.homeModel.freezeLearned ? Color.gray : Color.blue) // Disabled state color
                            .cornerRadius(10)
                    }
                    .disabled(viewModel.homeModel.todayLearned || viewModel.homeModel.freezeLearned) // Disable button if learned or frozen
                    
                    // Display freeze count
                    Text("\(viewModel.homeModel.freezesUsed) out of \(viewModel.homeModel.maxFreezes) freezes used")
                        .foregroundColor(.gray)
                }.padding(.top, 660)
            }
        }
        .navigationBarBackButtonHidden(true) // Hide back button
    }
    
    // Function to format current date
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: Date())
    }

    // Function to get month and year string from a date
    func monthYearString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    // Formatter for displaying day numbers
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }
    
    // Helper function to get day of week abbreviation
    func getDayOfWeek(day: Int) -> String {
        let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        return daysOfWeek[day % 7]
    }
}

#Preview {
    HomeView(language: "") // Preview HomeView with empty language
}
