## Todo List App - Flutter & Spring Boot

This is a basic TODO list application built with Flutter for the frontend and Spring Boot for the backend.

**Features:**

* Add new TODO items
* Mark TODO items as complete/incomplete
* View a list of all TODO items

**Prerequisites:**

* Flutter development environment setup ([https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install))
* Java 17 or later installed ([https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/))
* Apache Maven installed ([https://maven.apache.org/install.html](https://maven.apache.org/install.html))
* Basic understanding of Flutter and Spring Boot concepts

**Running the application:**

1. **Backend (Spring Boot):**
    * Clone this repository.
    * Open a terminal in the project directory.
    * Ensure the JAVA_HOME environment variable points to your JDK 17 installation.
    * Run `mvn spring-boot:run` to start the backend server.
2. **Frontend (Flutter):**
    * Navigate to the `flutter` directory within the project.
    * Run `flutter pub get` to install dependencies.
    * Run `flutter run` to start the Flutter app.

**Deployment (Optional):**

This repository provides a basic setup. You can deploy the backend to a cloud platform like Heroku and configure the Flutter app to connect to the deployed backend for a production-ready application.

**Contributing:**

Feel free to fork the repository and contribute improvements to this project.

**Note:**

This is a basic example and can be extended with features like deadlines, categories, and user authentication.

**Additional Notes:**

* This project uses Maven for dependency management instead of Gradle.
* The project requires Java 17 or a later version due to potential compatibility issues with Spring Boot functionalities.
