# Product Feature

## Description
This feature displays a list of products fetched from a mock API, implementing it using the BLoC pattern within a Clean Architecture approach. It includes functionalities for searching and filtering products.

## Requirements
- Dart 2.12+
- Flutter 2.0+
- http
- flutter_bloc
- dio
- http_mock_adapter

## Setup
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter test` to execute the tests.

## Usage
1. Navigate to the product page.
2. Use the search bar to search for products by name.
3. Use the dropdown to filter products by category.

## Accessibility
- Alt text for images/icons.
- Sufficient color contrast for text and UI elements.
- Semantic widgets and labels for screen reader support.

## Testing
Comprehensive unit tests are included for the BLoC, repository, and data source classes, covering edge cases and error scenarios.

## Code Quality
- Consistent naming conventions and code formatting.
- Documented classes, methods, and functions with clear docstrings.
- Inline comments for complex logic.
- Use of code quality tools such as `dart analyze` and `dartfmt`.

## Performance
- Efficient data fetching, state management, and UI rendering.

## State Management
The primary implementation uses BLoC for state management. Optionally, you can explore using other popular state management libraries such as Provider or Riverpod for comparison.

