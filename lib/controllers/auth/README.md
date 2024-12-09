Here’s the simplified README for the **Auth Service Module**:

---

# Auth Service Module

This module manages user authentication processes, including login, signup, and logout functionality. It interacts with the backend API and securely handles authentication tokens.

---

## Folder Structure

The module is organized as follows:

### `services/`
Handles API interactions for authentication.

- **`login_service.dart`**: Manages user login and stores the authentication token.
- **`signup_service.dart`**: Handles user signup and token storage.
- **`logout_service.dart`**: Manages user logout by deleting the authentication token.
- **`token_service.dart`**: Securely saves, retrieves, and deletes the authentication token.
- **`index.dart`**: Exports services for streamlined imports.

### `auth_service.dart`
The central service for managing user authentication. It combines functionality from all other services:
- **Login**
- **Signup**
- **Logout**
- **Token Validation**

---
