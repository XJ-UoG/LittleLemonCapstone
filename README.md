# Little Lemon iOS App

The app is designed for the Little Lemon restaurant, displaying a list of dishes fetched from a remote server. The app features an intuitive user interface with functionalities like onboarding, profile management, and navigation flow.

## Key Features:
1. **Home Screen**: Displays basic information about the restaurant and features a list of menu items.
2. **Onboarding Flow**: New users are prompted to enter their personal details when they first launch the app.
3. **Profile Screen**: Users can store and view their personal data, including a profile image.
4. **Navigation**: Smooth navigation allows users to move between the various screens of the app.
5. **Menu Data Fetching**: Dish data is fetched from a remote server using `URLSession` and parsed from JSON.
6. **Core Data Integration**: The app uses Core Data for storing and managing dish data locally. The menu items are filterable based on various criteria using Core Data queries.
7. **Data Persistence**: Menu data is stored on the disk, enabling offline functionality.

## Technologies Used:
- **SwiftUI** for the user interface.
- **Core Data** for local data storage and management.
- **URLSession** for networking and fetching data from a remote server.
- **JSON Parsing** for processing the menu data.

![alt text](https://github.com/XJ-UoG/LittleLemonCapstone/blob/main/simulator_screenshot_ACBF52E5-EE6D-403F-B6E5-722E653EDCFF.png)
