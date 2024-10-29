# Learning App
## OVERVIEW
An iOS app created with Xcode, implementing the *MVVM (Model-View-ViewModel)* pattern for efficient structure and organization. This app includes core functionality, unit tests, and UI tests for a 
efficient development experience.
This app is designed to help users establish and maintain a consistent learning routine. It offers features to track progress, set goals, and stay motivated.


##  Features:

### Home Module
•⁠  ⁠*Model*: ⁠ HomeModel ⁠ manages the home screen's data and logic, which Users can set specific learning goals and choose a desired timeframe.
•⁠  ⁠*ViewModel*: ⁠ HomeViewModel ⁠ mediates between the model and view, managing data transformations.
•⁠  ⁠*View*: ⁠ HomeView ⁠ represents the home screen's UI components.

### Learner Module
•⁠  ⁠*Model*: ⁠ LearnerModel ⁠ holds data for learner-related content ,and it show streak tracking feature for consecutive learning days and  freeze feature allow to users can pause their streak for a day if needed.
that will provide visualize to users about their progress over time.
•⁠  ⁠*ViewModel*: ⁠ LearnerViewModel ⁠ manages how data is presented and updated in the UI.

### Update Module
•⁠  ⁠*Model*: ⁠ UpdateModel ⁠ stores information related to learner goals updates.
•⁠  ⁠*ViewModel*: ⁠ UpdateViewModel ⁠ controls update data logic and presentation.
•⁠  ⁠*View*: ⁠ UpdateView ⁠ provides a user interface to display updates.


##  INTERFACE:

### HOME INTERFACE
<img width="329" alt="WelcomeScreen" src="https://github.com/user-attachments/assets/a2fa5155-3a09-4dd6-ab67-82adc3cc4529">



### LEARNING PROGRESS

<img width="333" alt="homepage" src="https://github.com/user-attachments/assets/7857f59c-9402-4fad-8d76-442ce283c239">



### UPDATE GOAL 

<img width="333" alt="Update goal" src="https://github.com/user-attachments/assets/6a1257b9-cdfc-4b96-a3b6-5ac81af82b09">


## APP DEVELOPMENT:

###This app leverages a variety of tools and frameworks to support the tracking and progress of individual learning goals.

###Programming Language:
The app is written in Swift, a language chosen for its performance and modern syntax, ideal for iOS development.
###Frameworks: 
SwiftUI is utilized to build an interactive and visually responsive user interface, enabling the creation of adaptive layouts and fluid animations.
###Development Environment:
Xcode serves as the development platform, providing an all-in-one suite for writing, debugging, and testing the application. Its powerful code editor, simulator, and debugging tools streamline the development process.
###Version Control: GitHub is used for repository hosting, enabling version control, issue tracking, and project management, making collaborative work efficient and organized.
