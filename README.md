# HM-Capstone
 iOS Capstone Project

READ ME


hmCapstone
Project Description
hmCapstone is a mobile application developed using SwiftUI for iOS 17, leveraging the NPPES API to download and display provider information efficiently as well as allow providers to enter and save their identity information on their device. This project was designed as part of a capstone assignment, aiming to simplify the access to healthcare provider details providing it directly on your mobile device.

Project Status
This project is currently in active development. Future updates will focus on enhancing the user interface, increasing data security, and expanding the dataset provided by the NPPES API into a separate dataset to ensure correct provider data.
Planned Features:
•	Advanced search filters for provider details.
•	Integration with additional healthcare data APIs.
•	User authentication and data encryption.
Environment Requirements
•	Xcode 15
•	Swift 5.6+
•	iOS 17 SDK
Installation Guide
To get the project running on your local machine, follow these steps:
1.	Clone the repository:
Bash command
git clone https://github.com/yourusername/hmCapstone.git 

2.	Open the project in Xcode:
Arduino command
open hmCapstone.xcodeproj 

3.	Select a suitable simulator or connect a compatible iOS device.
4.	Build and run the application by pressing Cmd + R.
5.	App will run a launch screen and onboarding screens to get you to the NPI search page.
6.	 Enter your valid NPI number to access the data.
Technology Used
•	SwiftUI: For building the user interface.
•	NPPES API: To fetch healthcare provider data (NPPES API Documentation).
Collaboration Guidelines
We welcome contributions to the hmCapstone project. If you have improvements or bug fixes, please follow these steps:
1.	Fork the repository.
2.	Create a new branch (git checkout -b feature-branch).
3.	Make your changes and commit them (git commit -am 'Add some feature').
4.	Push to the branch (git push origin feature-branch).
5.	Create a new Pull Request.
For bugs and feature requests, please open an issue first to discuss what you would like to change.
Known Bugs and Fixes
•	None at this time

FAQ
Q: How do I update the list of providers?
A: Enter a valid NPI on the NPI search page and tap “Fetch Provider Data”
Q: Can I view provider details offline?
A: Currently, the app requires an active internet connection to fetch provider details. Offline capabilities are planned for future releases.
License
hmCapstone is released under a Proprietary License with All rights reserved. The code cannot be copied, modified, or distributed without permission from the copyright holder. Please request a LICENSE file for more details.

Please see below for capstone requirements per grading rubric and comments.

Testing Strategy 

I opted to test both unit tests and UI tests for coverage of the app.  The test for NPIDetailViewUITests is the most comprehensive for UITests.  This test runs from launch to the lowest level in the app – the NPI Detail View.  Along the way to this level, the different UI components are also tested for the screens which lead to this terminal view.




Capstone Project Grading Rubric
Kodeco iOS Bootcamp: 2024 Jan-May


Requirement
Number	Requirement	Met/Not Met and Comment
	Note: Your capstone app will need to have a suitable API and meet the following criteria:	MET – NPPES api
1	●      It includes some data you saved in your app after retrieving it from an API.	MET 
2	●      It includes a list (or more) of any data the user can view.	MET – see file PublicDataView.swift
3	●      When the user clicks on one of the list cards, they can navigate to a detail screen showing the chosen data associated with that card.	MET – see PublicDataView.swift for navigation links to detail screens
4	●      It includes various calculations performed in the background on the data displayed.	MET calculations performed on dates of expirations for state medical license on StateMedicalLicenseDetailView.swift and for board certification on BoardCertificationDetailView.swift. Days until expiration is calculated from expiration date entered by user.
5	●      It uses images based on some kind of dynamic information delivered by the API	MET 
6	●      We suggest using Xcode 14.3 or 14.3.1 and iOS 16.x, or Xcode 15 and iOS 17.	MET see read me xcode 15 and iOS17
7	○      You can use the latest versions if you like, but remember that the videos and other content you’re learning from may not reflect the newer versions.	NOT Applicable
8	●      The app has a README file, including a basic explanation of the app and explanations of how your app fulfills each rubric item. Identify your features and any specific file names so your mentor doesn’t have to search for them while grading.	MET – See this file.
9	●      The app does not use any third-party frameworks or packages.	MET
10	●      The app has a launch screen suitable for the app. 	MET  See WelcomeScreenView.swift.  If you cant see this screen , delete app from simulator and re-run since the welcome screen has a state and should only be shown the first time the user opens app
11	○      It can be either a static or animated launch screen.	MET animated.  Fade out and spinner on above screen
12	●      All features in the app should be completed. 	MET all intended features for this app are completed and functional
13	○      Any unfinished feature should be moved to a different branch.	MET 
14	●      The app has at least one screen with a list using a view of your choice (List, Grid, ScrollView etc). This list should appear in a tab view with at least two tabs.	MET – two tab views are PublicDataView.swift and PrivateDataView.swift
15	●      Each item in the list should contain (at minimum) a name, a subtitle or description, and an image of the item, and any text should be styled appropriately. 	MET – see PublicDataView.swift
16	○      Tapping an item in this list should navigate (NavigationStack)  to a detail view: This should show the same data in the list item with some further details such as a longer description, bigger picture, price, or a Buy/Order button.	MET – see PublicDataView.swift with navigation links to take user to details page
17	○      Include enough items to ensure that the user has to scroll the list to see all the items in it. – NEED SCROLL FUNCTION ENABLED FOR LIST	MET  - See PublicDataView.swift for one example
18	pList password as needed – using this link for description of how to do it from class – ●      The app has one or more network calls using URLSession to download/upload data related to the core tasks of the app. The app’s repo does not contain API keys or other authentication information. Don’t store API keys or other authentication information in your app’s repo. See this article to store them in a plist, add the plist to your .gitignore file, then attach the plist to your Google doc.
	MET  - not needed since NPPES Api is open api with no need for password or token
19	●      If your API has a low request limit that your mentor might hit, highlight this in the README and explain how to use your freeze-dried data.	MET – NPPES api is a US Govt api with no request limit and no throttling.  The return from this appis is json file.
20	●      The app handles all typical errors related to network calls — including server error response codes and no network connection — and keeps the user informed.  	MET
21	●      The app uses at least one way to save data: user defaults, plist, file, or keychain. Specify your method in the README.	MET user defaults used since these are small size for user text data
22	●      The app uses Swift Modern Concurrency, async/await, and MainActor appropriately to keep slow-running tasks off the main thread and to update the UI on the main thread. No dispatch queues or completion handlers	MET
23	●      The app communicates to the user whenever data is missing or empty, the reason for that condition — for example, data cannot be loaded, or the user hasn’t created any — and the action the user should perform to move forward. The app should have no blank screens, and the user should never feel “lost”. 	MET  - alerts  and prompts throughout the app
24	●      All included screens work successfully without crashes or UI issues. 	MET
25	○      Views work for landscape and portrait orientations for the full range of iPhone sizes, including iPhone SE 2.	MET
26	○      Views work for both light and dark modes.	MET
27	○      There are no obvious UI issues, like UI components overlapping or running off the screen.	MET
28	●      The code should be organized and easily readable.	MET
29	○      Project source files are organized in folders such as Views, Models, Networking etc.	MET
30	○      View components are abstracted into separate Views and source files.	MET
31	○      The project uses MVVM architecture: The Model includes at least one ObservableObject with at least one Published value that at least one view subscribes to. Networking code is in a Service struct or class that can be instantiated by an ObservableObject.	MET - 
32	○      The project utilizes SwiftLint with Kodeco’s configuration file. Follow the instructions in the Kodeco Swift style guide to install it with Homebrew and the Build Run Script Phase. Don’t install it as a package. If you disable any rule for a line of code, explain why in a comment near the disable comment or, if it’s a general situation, explain in the README.  	MET
33	○      The app builds without Warnings or Errors. (Move your TODO warnings to a different branch.)	MET
34	●      The project has a test plan including both UI and unit tests, with a minimum of 50% code coverage, and all tests succeed. Make sure your test plan is in your repo.	MET
	●      The app includes:	MET
35	○      A custom app icon.	MET
36	○      An onboarding screen.	MET  - see OnBoardingView.swift
37	○      A custom display name.	MET
38	○      At least one SwiftUI animation.	MET  - see welcomescreen
39	○      Styled text properties. SwiftUI modifiers are sufficient.	MET

![image](https://github.com/hmcswain/HM-Capstone/assets/50780769/a1d3e16d-6781-483f-bb71-5a09d8e89ea8)
