<p align="center">
  <img src="./PantryPal_logo.jpg" width="150"/>
</p>

<h1 align="center">PantryPal</h1>

PantryPal is a single-screen grocery list app built using the Flutter SDK, focusing on functionality with a clean and intuitive user interface. The app leverages the BLoC pattern for state management, ensuring a well-organized architecture that separates business logic from the UI layer.

## App Architecture

### User Interface (UI)

- **Main Screen**: Displays the grocery list and allows user interactions. It includes:
    - **ListView**: Lists all the grocery items with options for interaction.
    - **FloatingActionButton**: Facilitates adding new grocery items.
    - **Item Widget**: Represents each grocery item, potentially with options to edit, delete, or select.

### State Management (BLoC/Cubit)

- **GroceryBloc/Cubit**: Manages the app's state, reacting to user interactions and updating the grocery list accordingly. It handles:
    - **Events**: Such as `AddItem`, `RemoveItem`, `EditItem`, and `ToggleItemSelection`.
    - **States**: Represents the state of the app, primarily the list of grocery items.

### Model

- **GroceryItem**: The data model for each item in the grocery list, including properties `name`, and `quantity`.

### Data Persistence

- **SharedPreferences**: Utilized for persisting the grocery list locally, ensuring data retention across app restarts.

### Business Logic Components (BLoC Pattern)

- The BLoC pattern is employed to maintain a clean separation between the business logic and the UI, facilitating maintainability and testability.

## Getting Started

This project is a starting point for a Flutter application.

To get started with PantryPal, ensure you have Flutter installed on your machine. Clone this repository, navigate to the project directory, and run `flutter pub get` to install the dependencies. Then, you can launch the app on your emulator or physical device using `flutter run`.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Developer Instructions

### Setting Up the Development Environment

1. **Install Flutter**: Follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install) to set up your local development environment.
2. **Clone the Repository**: Clone this repository to your local machine using `git clone https://github.com/pythagoras-19/PantryPal.git`.
3. **Install Dependencies**: Navigate to the project directory and run `flutter pub get` to fetch all the required dependencies.

### Running the App

- **Start the Emulator**: Launch your Android or iOS emulator.
- **Run the App**: Execute `flutter run` within the project directory to start the app on your emulator or connected device.

### Making Contributions

1. **Fork the Repository**: Create a personal fork of the project on GitHub.
2. **Create a New Branch**: For each new feature or fix, create a new branch based on the latest main branch.
3. **Implement Your Changes**: Make your changes in the project, adhering to existing coding styles and patterns.
4. **Write Tests**: Add relevant tests to cover your changes and ensure existing tests pass using `flutter test`.
5. **Submit a Pull Request**: Push your changes to your fork and open a pull request to the main repository.

### Code Style and Conventions

- Ensure you follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style) for writing clean, readable, and idiomatic Dart code.
- Document your code where necessary, especially for public APIs and complex logic.

Remember to regularly pull the latest changes from the upstream main branch, keep your application updated with the latest dependencies, and ensure your contributions are well-tested and documented.
