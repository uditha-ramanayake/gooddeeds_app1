# GoodDeeds App

GoodDeeds is a Flutter + Firebase social volunteering platform where people can discover community events, join activities, earn points, and share their impact through posts. Organizers can create and manage events, track participants, and mark attendance.

## What This App Does

- User registration and login with Firebase Authentication
- Role-based flow: Volunteer user or Organizer
- Event discovery feed with event details
- Join and leave events with automatic point and volunteer count updates
- Organizer dashboard to create, manage, and delete events
- Participant attendance management (present/absent)
- Community feed with posts, likes, comments, and follow/unfollow
- Profile and edit profile (name, image URL, bio)

## Built With

- Flutter (Dart)
- Firebase Core
- Firebase Authentication
- Cloud Firestore
- Firebase Storage (dependency added)
- Image Picker (dependency added)

## Project Structure

```
lib/
	main.dart
	models/
		event_model.dart
		user_model.dart
	screens/
		welcome_screen.dart
		login_screen.dart
		register_screen.dart
		role_selection_screen.dart
		organizer/
			create_event_screen.dart
			organizer_dashboard_screen.dart
			manage_event_screen.dart
			participants_screen.dart
		user/
			discover_events_screen.dart
			event_details_screen.dart
			my_events_screen.dart
			profile_screen.dart
			edit_profile_screen.dart
			community_screen.dart
			user_profile_screen_community.dart
	services/
		firebase_service.dart
```

## User Journeys

### Volunteer Flow

1. Open app -> Welcome
2. Register or login
3. Choose role (User)
4. Discover events
5. Join events to earn points
6. Open My Events to track/joined items and leave events if needed
7. Visit Profile and Community to edit profile, post updates, and interact

### Organizer Flow

1. Login
2. Choose role (Organizer)
3. Open Organizer Dashboard
4. Create events
5. Manage events and view participants
6. Mark attendance
7. Delete events when needed

## Firestore Collections Used

### users

- Stores user profile and role data
- Common fields:
	- name
	- email
	- role
	- points
	- profileImage
	- bio

### events

- Stores all event records
- Common fields:
	- title
	- description
	- date
	- location
	- imageUrl
	- points
	- volunteers
	- creatorId
	- createdAt

### user_events

- Relationship collection between users and events
- Used for joined status and attendance
- Common fields:
	- userId
	- eventId
	- name
	- email
	- points
	- joinedAt
	- attendance (pending, attended, absent)

### posts

- Community posts
- Common fields:
	- userId
	- text
	- imageUrl
	- timestamp
	- likedBy (array of user ids)

### posts/{postId}/comments

- Comment subcollection for each post
- Common fields:
	- userId
	- text
	- timestamp

### followers

- Follow relationships in community
- Common fields:
	- followerId
	- followingId
	- timestamp

## Local Setup

### Prerequisites

- Flutter SDK installed
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code
- Firebase project configured

### 1) Clone and install

```bash
git clone <your-repo-url>
cd gooddeeds_app-main
flutter pub get
```

### 2) Configure Firebase

This project already contains Android Firebase config at:

- android/app/google-services.json

For full multi-platform support, also add platform-specific Firebase config files (if missing), then ensure Firebase is enabled for:

- Authentication (Email/Password)
- Cloud Firestore

### 3) Run the app

```bash
flutter run -d windows
```

You can replace windows with your target device id.

## Useful Commands

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d windows
```

## Current Notes

- Analyzer currently reports clean: no issues found.
- Role is selected after login and persisted in Firestore.
- Registration currently routes directly to Discover Events after account creation.
- image_picker and firebase_storage are present in dependencies and can be expanded for file upload flows.

## Known Improvements You Can Add Next

- Add a proper Firestore security rules document
- Add screenshot section for README visuals
- Add CI workflow for analyze and test
- Add unit and widget tests for join/leave and attendance logic
- Replace image URL input with native image upload using Firebase Storage

## Troubleshooting

### App exits when running flutter run

If you see a prompt asking to select a device and then quit, run with an explicit device:

```bash
flutter run -d windows
```

### Firebase initialization or permission issues

- Verify Firebase files are in place
- Ensure Authentication and Firestore are enabled in Firebase Console
- Verify Firestore rules allow required reads/writes for your test environment

