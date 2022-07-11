# Weather Forecast iOS

## Introduce

An iOS app to retrieve weather information based on their searching criteria and render the searched results on dashboard screen. It just an MVP version with a very limited set of functionalities:

1. The application is a simple iOS application which is written by Swift.
2. The application is able to retrieve the weather information from OpenWeatherMaps API.
3. The application is able to allow user to input the searching term.
4. The application is able to proceed searching with a condition of the search term length must be from 3 characters or above.
5. The application is able to render the searched results as a list of weather items.
6. The application is able to support caching mechanism so as to prevent the app from generating a bunch of API requests.
7. The application is able to manage caching mechanism & lifecycle.
8. The application is able to handle failures.
9. The application is able to support the disability to scale large text for who can't see the
text clearly.
10. The application is able to support the disability to read out the text using VoiceOver
controls.

*Weather List Main Screen*

<img src="https://github.com/LocPham5788/WeatherForecast/master/Diagrams/search-result.png" data-canonical-src="https://github.com/LocPham5788/WeatherForecast/master/Diagrams/search-result.png" width="300" height="650" />

*UI Explaination*
The Weather Forecast app main screen included 3 compoments
1. Search Bar: For users input search city name, app will auto focus on search bar after app launch, users must input at least 3 characters to start searching, has display hint for users
2. Text Field: For users input number of days will display weather forecast, this field can be empty (default display 7 days)
3. Table View: For displaying list of weather if data responsed
Some dialogs for error handling and exception

## Explaination

1. Software architecture:

- MVVM: Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups. It is easy to implement a simple MVP version and create effectively unit tests for each layers, maintenance and develop in future.
- Caching mechanism: Use memory cache of iOS system to store a same query string which users had fetched before to prevent the app from generating a bunch of API requests.
- Singleton: (In Cache Manager class) Init only one time and use all places in application
- Error Handling: Improve UI/UX and make app more friendly for users when getting error from server API.

## Installation

1. Clone or download zip file from: [Github](https://github.com/LocPham5788/WeatherForecast) branch `master`
2. Extract zip if downloaded zip file in local machine
3. Make sure local machine has installed latest Xcode 13.4 and install Simulator 
4. Go to main project dictionary, open `WeatherForecast.xcodeproj`
5. Choose target Simulator, and click `Build`
6. After build succeeded, click `Run` to see on Simulator

## Requirements

- Xcode 13.4/MacOS 12.4
- Swift 5.0
- iOS 13.0 or later
- All devices (iPhone/iPad)
- Support Landscape/Portrait

## Checklists

- [x] 1. Programming language: Swift.
- [x] 2. Design app's architecture (MVVM)
- [x] 3. UI should be looks like in document attachment.
- [x] 4. Write Unit Tests
- [ ] 5. Acceptance Tests (UITests)
- [x] 6. Exception handling
- [x] 7. Caching handling
- [x] 8. Accessibility for Disability Supports:
  - a. Voice Over: Use a screen reader.
  - b. Scaling Text: Display size and font size: To change the size of items on your screen, adjust the display size or font size.
- [x] 9. Entity relationship diagram for the database and solution diagrams for the components, infrastructure design if any
  - a. Caching mechanism diagram
  - <img src="https://github.com/LocPham5788/WeatherForecast/master/Diagrams/caching-mechanism-diagram.png" data-canonical-src="https://github.com/LocPham5788/WeatherForecast/master/Diagrams/caching-mechanism-diagram.png" width="300" height="251" />
  
- [x] 10. Readme file includes:
  - a. Brief explanation for the software development principles, patterns & practices being applied
  - b. All the required steps in order to get the application run on local computer
  - c. Brief explanation for the code folder structure and the key Objective-C/Swift libraries
and frameworks being used
  - d. Checklist of items the candidate has done.

## Author

* Loc Pham, phamtanloc5788@gmail.com

## License

Weather Forecast is available under the MIT license. See the LICENSE file for more info.
