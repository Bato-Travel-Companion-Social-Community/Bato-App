

# Add Post Service Module

This module handles the functionality of adding image posts to the backend in a Flutter application. It is designed to be modular, simple, and easy to integrate.

---

## Folder Structure

The module is organized as follows:

### `services/`
Handles API interactions for adding posts.

- **`add_image_post_service.dart`**: Sends HTTP requests to upload images and post data to the backend.
- **`index.dart`**: Exports services for streamlined imports.

### `add_post_service.dart`
Wraps the lower-level services and provides a simple interface for adding posts. Defines:
- `baseUrl`: Backend API URL.
- `addPostService`: High-level method for adding posts.

---

## Usage

### `add_post_service.dart`
This is the main entry point for the "Add Post" feature.

