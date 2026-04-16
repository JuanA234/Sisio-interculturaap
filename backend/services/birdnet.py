from birdnetlib import Recording
from birdnetlib.analyzer import Analyzer

_analyzer = None

def _get_analyzer():
    global _analyzer
    if _analyzer is None:
        _analyzer = Analyzer()  # Carga el modelo una sola vez
    return _analyzer

async def identify(audio_path: str) -> str | None:
    """
    Analiza un archivo de audio con BirdNET y retorna el nombre
    científico de la especie con mayor confianza.
    """
    analyzer = _get_analyzer()
    recording = Recording(
        analyzer,
        audio_path,
        lat=10.9878,   # Coordenadas aproximadas del Magdalena, Colombia
        lon=-74.7889,
        date_recorded=None,
        min_conf=0.25
    )
    recording.analyze()

    if not recording.detections:
        return None

    # Ordenar por confianza y retornar el mejor resultado
    best = sorted(recording.detections, key=lambda d: d["confidence"], reverse=True)[0]
    return best.get("scientific_name")