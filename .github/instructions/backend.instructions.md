---
description: "Use when working with FastAPI backend, routers, services, or Python code in the backend directory. Covers async patterns, service integration, and API conventions."
name: "Backend Python Instructions"
applyTo: "backend/**/*.py"
---

# Backend Python Guidelines

## Code Style
- Use async/await for all I/O operations (HTTP requests, file handling).
- Follow FastAPI patterns: dependency injection, request/response models.
- Singleton pattern for expensive objects (e.g., BirdNET analyzer, Supabase client) using lazy loading.

## Architecture
- Modular routers in `routers/` for endpoints (e.g., `router_photo.py`).
- Single-file services in `services/` per external API (e.g., `birdnet.py`, `inaturalist.py`).
- Orchestrate services in routers: identify species → query Supabase → return combined result.

## Conventions
- Endpoints return dicts with `especie_identificada` (species) + `ficha_ancestral` (cultural data).
- Spanish in docstrings, error messages, and API responses.
- MIME type validation for file uploads.
- Hardcoded coordinates (lat=10.9878, lon=-74.7889) for BirdNET.
- BirdNET min confidence: 0.25.
- Error handling: 400 for bad requests, 404 for not found, with user-friendly Spanish messages.

## Examples
- Service call: `species = await birdnet_service.identify_species(audio_path)`
- Router response: `{"especie_identificada": "Turdus migratorius", "ficha_ancestral": {...}}`