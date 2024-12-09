
### **Module: Posts**

---

#### **Services**

##### **Posts Service**
- **File**: `posts_service.dart`
- **Purpose**: Main service for managing posts.

###### Methods:
- **`getAllImagePosts()`**
  - **Purpose**: Fetches all posts containing images.
  - **Depends on**: `GetImagePostsService`
  - **Signature**:
    ```dart
    Future<List<MyCommunityPostModel>?> getAllImagePosts();
    ```

---

##### **Get Image Posts Service**
- **File**: `get_image_posts_service.dart`
- **Purpose**: Handles API calls to fetch all image posts.

###### Methods:
- **`getAllImagePosts()`**
  - **Purpose**: Fetches all image posts from the server.
  - **URL**: `/api/post/get_image_posts`
  - **Signature**:
    ```dart
    Future<List<MyCommunityPostModel>?> getAllImagePosts();
    ```

---

##### **Like Post Service**
- **File**: `like_post_service.dart`
- **Purpose**: Handles liking or unliking a post.

###### Methods:
- **`toggleLike(String postId)`**
  - **Purpose**: Toggles like status for a given post.
  - **URL**: `/api/post/test_post/:postId/like`
  - **Signature**:
    ```dart
    Future<Map<String, dynamic>?> toggleLike(String postId);
    ```

---

##### **Comment Post Service**
- **File**: `comment_post_service.dart`
- **Purpose**: Manages comments on posts.

###### Methods:
- **`addComment(String postId, String text)`**
  - **Purpose**: Adds a comment to a specific post.
  - **URL**: `/api/post/test_post/:postId/comment`
  - **Signature**:
    ```dart
    Future<Map<String, dynamic>?> addComment(String postId, String text);
    ```

- **`getComments(String postId)`**
  - **Purpose**: Retrieves all comments for a specific post.
  - **URL**: `/api/post/test_post/:postId/comments`
  - **Signature**:
    ```dart
    Future<List<Comment>> getComments(String postId);
    ```

---

#### **Exports**
- **File**: `index.dart`
- **Exports**:
  ```dart
  export 'get_image_posts_service.dart';
  export 'like_post_service.dart';
  export 'comment_post_service.dart';
  ```

---

#### **Endpoints**
| **Feature**        | **Method** | **URL**                                    |
|---------------------|------------|--------------------------------------------|
| Fetch All Posts     | `GET`      | `/api/post/get_image_posts`                |
| Like/Unlike Post    | `POST`     | `/api/post/test_post/:postId/like`         |
| Add Comment         | `POST`     | `/api/post/test_post/:postId/comment`      |
| Get Comments        | `GET`      | `/api/post/test_post/:postId/comments`     |

