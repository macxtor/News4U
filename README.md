![n4u_logo.png](assets%2Fn4u_logo.png)
# News4U: A Sample News Application

## Overview
News4U is a sample Flutter application designed to showcase best practices in software architecture and design patterns. It follows Clean Architecture principles and employs the BLoC (Business Logic Component) pattern for state management.

## Features

- Display top news articles
- Cache articles locally for offline access
- Error handling for network and data issues

## Clean Architecture

Clean Architecture is a software design philosophy that separates the concerns of an application into layers, each with a specific responsibility. The layers typically include:

1. **Presentation Layer**: Handles UI-related logic and interacts with the BLoC layer.
2. **Domain Layer**: Contains business logic, usecase,entities .
3. **Data Layer**: Manages data access, including interactions with local and remote data sources.

The separation of concerns makes the codebase modular, scalable, and easy to maintain. Clean Architecture promotes testability and allows for the flexibility to change one layer without affecting others.

![bloc.png](bloc.png)
## Code Pattern: BLoC

BLoC is a state management pattern widely used in Flutter applications. It stands for Business Logic Component and separates the presentation layer from the business logic. Key components of the BLoC pattern include:

- **BLoC**: Manages the state of the application and contains business logic.
- **States**: Represent the state of the UI at a specific point in time.
- **Cubit**: A lightweight version of BLoC, suitable for simpler use cases.

BLoC simplifies the UI by removing business logic, making the application more modular and testable. It also provides a clear separation between the UI and business logic.

## Unit Testing

Unit testing is a crucial aspect of software development, ensuring the reliability and stability of the codebase. News4U uses the `flutter_test` library for unit testing and `mocktail` for creating mock objects during testing.

Key testing libraries:

- **bloc_test**: Facilitates testing BLoC components.
- **mocktail**: Enables the creation of mock objects for testing.

Unit tests in News4U cover various scenarios, including testing BLoC behavior, error handling, and data interactions.

## Libraries Used

- **dio**: A powerful HTTP client for making network requests.
- **shared_preferences**: Provides a simple way to persistently store and retrieve key-value pairs.
- **equatable**: Simplifies equality comparisons, especially when dealing with complex objects.
- **get_it**: A service locator for dependency injection, facilitating the management of object instances.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter installed on your machine ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Emulator or physical device for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/macxtor/news4u.git
2. Change into the project directory:

   ```bash
    cd news4u
3. Install dependencies:

    ```bash
    flutter pub get
4. Run the app:

    ```bash
   flutter run
### Running Tests
To run unit tests, use the following command:

   ```bash
   flutter test