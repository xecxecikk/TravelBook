# Location Marker iOS Application

Location Marker is an iOS app that allows users to select a location on the map and save it to Core Data. The app lets users mark a location on the map and enter details like title and description. The saved locations are listed, and users can edit or delete them as needed.

## Tools and Technologies Used

- `Swift`: The programming language used for the development of the application.
- `UIKit`: Framework used for building user interface components.
- `CoreData`: Framework used for local data storage.
- `MapKit`: Framework used for map functionality.
- `CoreLocation`: Framework used for accessing the user's current location.

  
## Features

### 1. Select and Save Location
Users can long press on the map to select a location.
The selected location, along with the title and description, is saved to Core Data.
The location, title, and description are displayed as annotations on the map.

### 2. Listing and Editing Locations
The app displays the saved locations in a UITableView.
Users can tap on any item in the list to view and edit its details.

### 3. Deleting Locations
Users can swipe to delete a location from the list.
Deleting a location removes it from both the UITableView and Core Data.

### 4. Navigation and Detail Screen
Users can tap on a map annotation to view the location in Apple Maps for navigation.
Tapping on a list item redirects users to another screen where they can view and edit the location's details.


## Usage

### 1. Viewing Locations
When the app starts, the saved locations are displayed in a UITableView. Each item in the list shows the title of the location.

### 2. Select and Save Location
Users can long press on the map to select a location.
After entering the title and description, the location is saved to Core Data.
The saved location is displayed on the map with an annotation.
### 3. Listing and Selecting Items
The list of saved locations is shown in a UITableView.
When a user taps on an item in the list, they are redirected to a detail screen where they can view and edit the location’s details.
### 4. Deleting Locations
Users can delete a location by swiping to delete or tapping the "Delete" button on the list item.
This action removes the location from both the UITableView and Core Data.


## Application Flow

### 1. ViewController - Select and Save Location
The ViewController allows users to select a location on the map by long pressing on a point. The selected location, along with its title and description, is saved to Core Data and displayed on the map.

- Select Location: Users can long press on the map to select a location.
- Save Data: Once the title and description are entered, clicking the "Save" button stores the data in Core Data.
  
### 2. ListViewController - Listing and Deleting Locations
The ListViewController displays the saved locations from Core Data in a list. Users can edit or delete the selected locations.

- `Fetching Data`: The getData function fetches the saved data from Core Data and assigns it to the titleArray and idArray lists.
- `Listing`: Locations are displayed in a UITableView.
- `Deleting`: Users can swipe or tap "Delete" to remove a location from the list and Core Data.












https://github.com/user-attachments/assets/ffc94a13-851d-4784-9956-bbc9d7c6ee09
















