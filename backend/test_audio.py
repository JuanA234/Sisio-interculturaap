import pytest
from fastapi.testclient import TestClient
from main_py import app

client = TestClient(app)

def test_audio_identify_missing_file():
    response = client.post("/audio/identify")
    assert response.status_code == 422  # Missing file

def test_audio_identify_invalid_mimetype():
    # Simular archivo de texto
    response = client.post(
        "/audio/identify",
        files={"file": ("test.txt", b"not audio", "text/plain")}
    )
    assert response.status_code == 400
    assert "debe ser un audio WAV" in response.json()["detail"]

def test_audio_identify_valid_audio():
    # Requiere WAV válido con aves
    with open("test_bird_audio.wav", "rb") as f:
        response = client.post(
            "/audio/identify",
            files={"file": ("bird.wav", f, "audio/wav")}
        )
    assert response.status_code == 200
    assert "especie_identificada" in response.json()