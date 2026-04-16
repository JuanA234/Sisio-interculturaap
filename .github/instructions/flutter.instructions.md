---
description: "Use when developing Flutter mobile app, screens, widgets, or Dart code in the app directory. Covers Material Design, dependencies, and app architecture."
name: "Flutter Instructions"
applyTo: "app/**/*.dart"
---

# Flutter Guidelines

## Code Style
- Use Material Design components for UI consistency.
- Follow Flutter best practices: state management, widget composition.

## Dependencies
- http: For API calls to backend.
- image_picker: Camera/gallery access for photos.
- record: Audio recording.
- audioplayers: Audio playback.
- path_provider: File system paths.

## Architecture
- Send photo/audio to backend FastAPI endpoints.
- Receive species identification + cultural data.
- Display results in user-friendly Spanish interface.

## Conventions
- Spanish language for UI text and user messages.
- Handle file uploads (images/audio) with proper permissions.
- Integrate with backend responses: `especie_identificada` + `ficha_ancestral`.

## Examples
- Image picker: `final image = await ImagePicker().pickImage(source: ImageSource.camera);`
- API call: `final response = await http.post(Uri.parse('http://localhost:8000/photo/identify'), files: {...});`