import os
from supabase import create_client, Client
from dotenv import load_dotenv

load_dotenv()

_client: Client = None

def _get_client() -> Client:
    global _client
    if _client is None:
        url = os.environ["SUPABASE_URL"]
        key = os.environ["SUPABASE_KEY"]
        _client = create_client(url, key)
    return _client

async def get_ficha(nombre_cientifico: str) -> dict | None:
    """
    Busca en Supabase la ficha ancestral de un ave por nombre científico.
    """
    client = _get_client()
    resp = (
        client.table("aves")
        .select("*")
        .ilike("nombre_cientifico", nombre_cientifico)
        .limit(1)
        .execute()
    )
    data = resp.data
    return data[0] if data else None