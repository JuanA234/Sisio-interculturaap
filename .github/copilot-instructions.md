# Project Guidelines

## Code Style
- **Python**: Use async/await for all I/O operations. Follow FastAPI patterns with modular routers and services.
- **Dart/Flutter**: Material Design components. Dependencies: http, image_picker, record, audioplayers, path_provider.
- Exemplar files: [backend/services/birdnet.py](/backend/services/birdnet.py) (singleton pattern), [backend/routers/router_photo.py](backend/routers/router_photo.py) (endpoint orchestration).

## Architecture
Flutter mobile app with FastAPI backend orchestrating AI services (BirdNET for audio, iNaturalist for photos, Supabase for ancestral data).
- Frontend: Flutter app sends photo/audio to backend.
- Backend: Routes to services, queries Supabase by scientific name, returns species + cultural data.
- Services: Single-file modules per external service.
- Database: Supabase PostgreSQL with `aves` table.
See [README.md](README.md) for architecture diagram and flow.

## Database
- Schema: Manual SQL migration in `backend/supabase_schema.sql`.
- Table: `aves` with scientific name lookup (5 species in Phase 1).
- Fields: All Spanish (nombre_cientifico, nombre_nativo, etc.).

## Build and Test
- **Backend**: `cd backend && pip install -r requirements.txt && python -m uvicorn main_py:app --reload --port 8000`
- **Flutter**: `cd app && flutter pub get && flutter run`
- Health check: `GET http://localhost:8000/` returns `{"status": "ok", "proyecto": "Sisio interculturaap", "version": "0.1.0"}`
- Test photo endpoint: `POST http://localhost:8000/photo/identify` with image file upload.
- Test audio endpoint: `POST http://localhost:8000/audio/identify` with WAV file upload (when implemented).

## Conventions
- Naming: Routers as `router_{endpoint}.py`, services as `{service_name}.py`.
- Language: Spanish in docstrings, API responses, database fields, and Flutter UI.
- Error handling: User-friendly Spanish messages for 400/404.
- File uploads: MIME type validation required.
- Singleton pattern for expensive objects (BirdNET analyzer, Supabase client).
- Endpoints return dicts with `especie_identificada` + `ficha_ancestral`.
- Coordinates hardcoded to Magdalena region (lat=10.9878, lon=-74.7889) for BirdNET.
- BirdNET min confidence: 0.25.
- Async/await throughout backend and Flutter for all I/O operations.
See [ROADMAP.md](docs/ROADMAP.md) for phase evolution and [BACKLOG.md](docs/BACKLOG.md) for current sprint stories.

## Known Issues
- Audio router (`backend/routers/audio.py`) is placeholder-only; backend startup will fail on import. Must implement following [router_photo.py](backend/routers/router_photo.py) pattern for Week 3 (US-05, US-06, US-07).

## Pitfalls
- Environment variables required: Copy `backend/.env.example` to `.env` with Supabase credentials; `.env` is gitignored.
- MIME type validation: Photo router requires `file.content_type.startswith("image/")` check.
- Async httpx timeout: iNaturalist calls set 15-second timeout; slower networks may timeout.
- Supabase schema not auto-created: Manual SQL migration needed; schema in `backend/supabase_schema.sql`.
- Phase 1 scope: Only 5 bird species; other birds return 404 with "ave identificada pero aún no tiene ficha ancestral".
- Flutter dependencies: `record` package requires native permissions (Android/iOS manifest setup).
- CORS middleware: Currently `allow_origins=["*"]` — restrict in production.
- Native permissions: Add CAMERA, RECORD_AUDIO, READ_EXTERNAL_STORAGE to AndroidManifest.xml and iOS plist for image_picker and record.
- Temp file cleanup: image_picker and record create temp files requiring explicit deletion.
- No state management: Flutter app lacks Provider/Riverpod; needed for API calls across screens.
- Backend URL: Hardcoded to localhost:8000; production strategy undefined.
- Flutter app: At boilerplate stage; missing screens, services, models — implement following [BACKLOG.md](docs/BACKLOG.md).