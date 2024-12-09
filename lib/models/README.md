## **Models Module Documentation**

The **Models Module** serves as the foundation for the data structures used throughout the application. It includes essential classes like `UserModel`, `MyCommunityPostModel`, `Comment`, and `LikeUser`. These models provide consistency and structure when working with data retrieved from or sent to APIs.

---

### **File Structure**
```
models/
│
├── index.dart
├── user.dart
├── my_community_post.dart
└── comment.dart
```

---

### **Classes Overview**

#### **1. UserModel**
- **File**: `user.dart`
- **Description**: Represents a user in the application.
- **Fields**:
  - `id` *(String)*: Unique identifier for the user.
  - `displayName` *(String)*: Display name of the user.
  - `avatar` *(String)*: URL of the user's avatar.
- **Methods**:
  - `UserModel.fromJson(Map<String, dynamic> json)`: Creates a `UserModel` from JSON data.
  - `toJson()`: Converts a `UserModel` instance to JSON.
- **Example**:
  ```dart
  final user = UserModel.fromJson({
    "_id": "123",
    "display_name": "John Doe",
    "avatar": "https://example.com/avatar.jpg"
  });
  ```

---

#### **2. MyCommunityPostModel**
- **File**: `my_community_post.dart`
- **Description**: Represents a post in the community feed.
- **Fields**:
  - `id` *(String)*: Unique identifier for the post.
  - `images` *(List<String>)*: List of image URLs associated with the post.
  - `caption` *(String)*: Caption text for the post.
  - `location` *(String)*: Geographical location of the post.
  - `owner` *(UserModel)*: The user who created the post.
  - `likes` *(List<LikeUser>)*: List of users who liked the post.
  - `likeCount` *(int)*: Total number of likes.
  - `isLiked` *(bool)*: Whether the current user has liked the post.
  - `commentCount` *(int)*: Number of comments on the post.
- **Methods**:
  - `MyCommunityPostModel.fromJson(Map<String, dynamic> json)`: Creates a `MyCommunityPostModel` from JSON data.
  - `toJson()`: Converts a `MyCommunityPostModel` instance to JSON.
- **Example**:
  ```dart
  final post = MyCommunityPostModel.fromJson({
    "_id": "post123",
    "images": ["https://example.com/image1.jpg"],
    "caption": "Beautiful sunset!",
    "location": "Beach",
    "ownerId": {"_id": "user123", "display_name": "John", "avatar": "avatar.jpg"},
    "likes": [{"_id": "user456", "display_name": "Alice", "avatar": "avatar2.jpg"}],
    "likeCount": 5,
    "isLiked": true,
    "commentCount": 2
  });
  ```

---

#### **3. Comment**
- **File**: `comment.dart`
- **Description**: Represents a comment on a post.
- **Fields**:
  - `id` *(String)*: Unique identifier for the comment.
  - `user` *(LikeUser)*: The user who posted the comment.
  - `text` *(String)*: The content of the comment.
  - `createdAt` *(DateTime)*: Timestamp for when the comment was created.
- **Methods**:
  - `Comment.fromJson(Map<String, dynamic> json)`: Creates a `Comment` from JSON data.
- **Example**:
  ```dart
  final comment = Comment.fromJson({
    "_id": "comment123",
    "user": {"_id": "user123", "display_name": "John", "avatar": "avatar.jpg"},
    "text": "Great photo!",
    "createdAt": "2023-12-01T12:34:56Z"
  });
  ```

---

#### **4. LikeUser**
- **File**: `my_community_post.dart` (Used in `likes` and `comments`)
- **Description**: Represents a user who liked a post or commented.
- **Fields**:
  - `id` *(String)*: Unique identifier for the user.
  - `displayName` *(String)*: Display name of the user.
  - `avatar` *(String)*: URL of the user's avatar.
- **Methods**:
  - `LikeUser.fromJson(Map<String, dynamic> json)`: Creates a `LikeUser` from JSON data.
- **Example**:
  ```dart
  final likeUser = LikeUser.fromJson({
    "_id": "user123",
    "display_name": "John",
    "avatar": "https://example.com/avatar.jpg"
  });
  ```

---

### **Exports**
- **File**: `index.dart`
- **Purpose**: Provides a single entry point for importing all models.
- **Code**:
  ```dart
  export 'user.dart';
  export 'my_community_post.dart';
  export 'comment.dart';
  ```

---

### **Best Practices**
1. **Consistency**: Always use the `fromJson` and `toJson` methods for serialization and deserialization.
2. **Reusability**: Reuse `LikeUser` for both likes and comments to avoid redundancy.
3. **Validation**: Ensure proper null-checks or default values when parsing JSON.

---

### **Usage Example**
```dart
import 'models/index.dart';

void main() {
  // Example: Parsing a post JSON
  final postJson = {
    "_id": "post123",
    "images": ["https://example.com/image.jpg"],
    "caption": "Awesome post!",
    "location": "Paris",
    "ownerId": {"_id": "user123", "display_name": "Jane Doe", "avatar": "avatar.jpg"},
    "likes": [{"_id": "user456", "display_name": "Alice", "avatar": "avatar2.jpg"}],
    "likeCount": 10,
    "isLiked": true,
    "commentCount": 5,
  };

  final post = MyCommunityPostModel.fromJson(postJson);

  print('Post ID: ${post.id}');
  print('Owner: ${post.owner.displayName}');
  print('Like Count: ${post.likeCount}');
}
```

