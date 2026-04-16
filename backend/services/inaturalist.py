import httpx

INATURALIST_API_URL = "https://api.inaturalist.org/v1/computervision/score_image"

async def identify(img_bytes: bytes) -> str | None:
    """
    Envía una imagen a iNaturalist y retorna el nombre científico
    de la especie con mayor puntaje.
    """
    async with httpx.AsyncClient() as client:
        resp = await client.post(
            INATURALIST_API_URL,
            files={"image": ("photo.jpg", img_bytes, "image/jpeg")},
            timeout=15.0
        )
    if resp.status_code != 200:
        return None

    results = resp.json().get("results", [])
    if not results:
        return None

    # Retorna el nombre científico del resultado con mayor score
    top = results[0]
    return top.get("taxon", {}).get("name")