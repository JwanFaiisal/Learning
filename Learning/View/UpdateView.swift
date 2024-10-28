//
//  UpdateView.swift
//  Learning
//
//  Created by Jwan Faisal Alameer on 25/04/1446 AH.
//

import SwiftUI

struct UpdateView: View {
    @StateObject private var viewModel = UpdateViewModel() // ViewModel
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack{ Text("Learning goal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom , 750)
                }
                
                Button(action: {
                    viewModel.startLearning() 
                             }) {
                                 Image(systemName: "chevron.left")
                                     .foregroundColor(.orange)
                                 Text("Back")
                                     .foregroundColor(.orange)
                                 
                             }.padding(.bottom,750)
                    .padding(.trailing ,330)

                
                Button(action: {
                    viewModel.startLearning() // ViewModel
                }) {
                    Text("Update")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                } .padding(.bottom,750)
                    .padding(.leading ,280)
                
                
                VStack{
                    Text("I want to learn")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading ,-180)
                    
                    TextField("Swift", text:     $viewModel.learningGoal.learning
                    )
                    .foregroundColor(.gray)
                    .accentColor(.orange)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray).opacity(0.5),alignment: .bottom )
                    .padding(.horizontal, 20)
                    
                } .padding(.top,-330)
                
                VStack{
                    Text("I want to learn it in a")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading , -180)
                        .padding(.top , -250)
                    
                }
                
                
                HStack {
                    Button(action: {
                        viewModel.updateSelectedOption("Week")
                    }) {
                        Text("Week") // View
                            .fontWeight(viewModel.learningGoal.selectedOption == "Week" ? .bold : .regular)// استخدام Model
                            .frame(width: 50, height: 10)
                            .foregroundColor(viewModel.learningGoal.selectedOption == "Week" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningGoal.selectedOption == "Week" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    .padding(.leading, -90)
                    
                    Button(action: {
                        viewModel.updateSelectedOption("Month")
                    }) {
                        Text("Month") // View
                            .fontWeight(viewModel.learningGoal.selectedOption == "Month" ? .bold : .regular) // استخدام Model
                            .frame(width: 60, height: 10)
                            .foregroundColor(viewModel.learningGoal.selectedOption == "Month" ? Color.black : Color.orange)
                            .padding()
                            .background(viewModel.learningGoal.selectedOption == "Month" ? Color.orange : Color.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top, 270)
                    
                    Button(action: {
                        viewModel.updateSelectedOption("Year")
                    }) {
                        Text("Year") // View
                            .fontWeight(viewModel.learningGoal.selectedOption == "Year" ? .bold : .regular) // استخدام Model
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
            .background(NavigationLink(destination: HomeView(language: viewModel.learningGoal.learning), isActive: $viewModel.navigateToHome) { EmptyView() }) // View
        }
        .navigationBarBackButtonHidden(true)

        
    }
}


#Preview {
    UpdateView()
}
