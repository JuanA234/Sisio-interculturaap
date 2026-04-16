# 🗺️ Roadmap de Escalabilidad — Sisio interculturaap

Este documento describe la evolución planificada del proyecto desde el prototipo académico hasta una aplicación standalone completamente funcional sin conexión a internet.

---

## Comparativa: Prototipo vs. Versión Standalone

| Componente | Prototipo (Online) | Versión Standalone (Offline) |
|---|---|---|
| **Lógica de negocio** | FastAPI en la nube | Migrada al dispositivo |
| **Base de datos** | Supabase remoto | SQLite local en el teléfono |
| **Reconocimiento visual** | iNaturalist API | Modelo de visión local (TFLite) |
| **Reconocimiento de audio** | BirdNET en servidor | BirdNET embebido en la app |
| **Conectividad requerida** | Internet permanente | Ninguna (WiFi solo para actualizaciones) |

---

## Fases de Desarrollo

### FASE 1 — Prototipo Académico *(actual)*

> **Meta:** Demostrar el concepto y la propuesta de valor del proyecto.

```
Stack:
  Flutter + FastAPI + Supabase + BirdNET en servidor + iNaturalist API

Características:
  ✔ Reconocimiento de 5 aves representativas de la región
  ✔ Identificación por foto (iNaturalist API)
  ✔ Identificación por sonido (BirdNET en backend)
  ✔ Ficha ancestral por ave (nombre nativo, significado, cosmovisión)
  ✔ Interfaz móvil funcional en Flutter
  ✗ Requiere conexión a internet
  ✗ Sin sincronización offline

Entrega estimada: 28 de mayo
```

---

### FASE 2 — Versión Financiada Inicial *(post-financiamiento universitario)*

> **Meta:** Hacer la app usable en zonas con conectividad limitada, expandir el catálogo de aves.

```
Stack:
  Flutter + BirdNET embebido + SQLite local + Supabase (solo sync)

Cambios respecto a Fase 1:
  → BirdNET-Analyzer migrado al dispositivo (corre localmente)
  → Base de datos de fichas ancestrales en SQLite local
  → Sincronización diferida: descarga contenido nuevo cuando hay WiFi
  → Expansión del catálogo: de 5 a 20-30 aves

Características nuevas:
  ✔ Funcionamiento offline para las aves del catálogo local
  ✔ Actualizaciones de contenido por paquetes descargables
  ✔ Soporte multilingüe (Kogui, Wiwa, Arhuaco)
  ✗ Reconocimiento visual aún depende de conexión (iNaturalist)
```

---

### FASE 3 — Versión Standalone Completa *(largo plazo)*

> **Meta:** Aplicación 100% autónoma, sin necesidad de internet en ningún momento.

```
Stack:
  Flutter + BirdNET embebido + TFLite (modelo propio) + SQLite local

Cambios respecto a Fase 2:
  → Modelo de reconocimiento visual propio entrenado con TensorFlow Lite
    específico para aves del Magdalena y la Sierra Nevada
  → Catálogo completo de aves de la región disponible offline
  → Paquetes de contenido descargables por región o comunidad

Características nuevas:
  ✔ 100% offline — no requiere internet en ningún momento
  ✔ Modelo visual entrenado con datos reales de la región
  ✔ Expansible mediante paquetes de aves por zona geográfica
  ✔ Potencial de uso en otras comunidades indígenas de Colombia
```

---

## Diagrama de Evolución

```
FASE 1                    FASE 2                    FASE 3
──────                    ──────                    ──────
App Flutter               App Flutter               App Flutter
    │                         │                         │
    ▼                         ▼                         ▼
FastAPI (nube)            BirdNET local             BirdNET local
    │                     SQLite local              TFLite local
    ├── BirdNET            Sync WiFi                 SQLite local
    ├── iNaturalist        iNaturalist (online)      Sin dependencias
    └── Supabase           Supabase (solo sync)      externas
```

---

## Criterios para Pasar de Fase

| Transición | Criterio |
|---|---|
| Fase 1 → Fase 2 | Financiamiento universitario aprobado + validación con comunidad |
| Fase 2 → Fase 3 | Dataset de imágenes suficiente para entrenar modelo propio (500+ fotos por especie) + alianza con biólogos o instituciones como el Instituto Humboldt |

---

## Notas Técnicas para Futuros Desarrolladores

- **BirdNET** está diseñado desde su origen para funcionar en campo sin internet. La migración de Fase 1 a Fase 2 en este componente es directa.
- **TFLite** (TensorFlow Lite) es el estándar para correr modelos de ML en dispositivos móviles con Flutter. El modelo de Fase 3 debería entrenarse en TensorFlow y exportarse a `.tflite`.
- El contenido ancestral es el activo más valioso del proyecto. Debe ser validado por la comunidad en cada fase y versionado cuidadosamente en la base de datos.
- Considerar en Fase 2 un panel de administración web (puede ser la interfaz de Supabase) para que gestores de la comunidad puedan agregar o editar fichas sin tocar código.
