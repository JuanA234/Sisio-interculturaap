# 🦜 Sisio interculturaap — Reconocimiento de Aves con Conocimiento Ancestral

> Aplicación móvil para preservar el conocimiento ancestral de las comunidades indígenas del Magdalena, Colombia, a través del reconocimiento de aves por foto y sonido.

---

## 📖 Descripción del Proyecto

Durante generaciones, las comunidades indígenas de la Sierra Nevada de Santa Marta y el Magdalena han mantenido una conexión profunda con la naturaleza, en la que las aves juegan un rol central dentro de su cosmovisión, rituales y tradiciones. Este conocimiento ancestral ha ido desapareciendo con el tiempo.

**Sisio interculturaap** es una aplicación móvil que permite a los usuarios identificar aves de la región mediante fotografía y grabación de sonido, y recibir a cambio no solo información biológica, sino también el significado cultural, el nombre en lengua indígena nativa (Kogui, Wiwa, Arhuaco) y el rol de cada ave dentro de la cosmovisión de estas comunidades.

### Objetivos

- Preservar y difundir el conocimiento ancestral asociado a las aves de la región.
- Facilitar el reconocimiento de aves a través de IA accesible desde un dispositivo móvil.
- Construir una base tecnológica escalable que permita, en el futuro, operar completamente sin conexión a internet en zonas rurales.
- Servir como puente entre la tecnología y las comunidades indígenas del Magdalena.

---

## 🛠️ Stack Tecnológico

### Frontend
| Tecnología | Rol |
|---|---|
| **Flutter** | Framework principal de la app móvil (Android / iOS) |
| **Dart** | Lenguaje de Flutter |

### Backend
| Tecnología | Rol |
|---|---|
| **FastAPI (Python)** | API REST principal, orquesta las llamadas a servicios de IA |
| **Railway / Render** | Hosting del backend (gratuito para prototipo) |

### Inteligencia Artificial
| Tecnología | Rol |
|---|---|
| **BirdNET-Analyzer** | Reconocimiento de aves por canto/sonido (Cornell Lab) |
| **iNaturalist API** | Reconocimiento de aves por fotografía |

### Base de Datos y Almacenamiento
| Tecnología | Rol |
|---|---|
| **Supabase (PostgreSQL)** | Base de datos principal, almacena las fichas ancestrales |
| **Supabase Storage** | Almacenamiento de audios y fotos de referencia |

---

## 🏗️ Arquitectura del Sistema

```
[App Flutter]
     │
     ├──► Foto ──────────► [Backend FastAPI] ──► iNaturalist API
     │                            │
     └──► Audio ─────────────────►├──► BirdNET-Analyzer
                                  │
                                  └──► [Supabase DB]
                                            │
                                       Ficha ancestral
                                       ├── Nombre científico
                                       ├── Nombre en español
                                       ├── Nombre en lengua nativa
                                       ├── Significado ancestral
                                       ├── Rol en la cosmovisión
                                       └── Hábitat en la región
                                            │
                                      ◄─────────────
                                      Respuesta al usuario
```

### Flujo de uso

1. El usuario abre la app y captura una **foto** o graba el **canto** de un ave.
2. La app envía el archivo al **backend FastAPI**.
3. El backend enruta la solicitud:
   - **Foto** → iNaturalist API para identificación visual.
   - **Audio** → BirdNET-Analyzer para identificación por canto.
4. Con el ave identificada, el backend consulta **Supabase** para obtener la ficha ancestral.
5. La app presenta al usuario el resultado con el nombre nativo, significado cultural y demás información ancestral.

---

## 🗄️ Estructura del Proyecto

```
sisio interculturaap/
├── app/                  # Proyecto Flutter
│   ├── lib/
│   │   ├── screens/      # Pantallas de la app
│   │   ├── services/     # Conexión con el backend
│   │   └── models/       # Modelos de datos
│   └── pubspec.yaml
│
├── backend/              # Proyecto FastAPI
│   ├── main.py           # Entrada principal de la API
│   ├── routers/
│   │   ├── photo.py      # Endpoint de reconocimiento por foto
│   │   └── audio.py      # Endpoint de reconocimiento por audio
│   ├── services/
│   │   ├── birdnet.py    # Integración con BirdNET
│   │   └── inaturalist.py# Integración con iNaturalist API
│   └── requirements.txt
│
├── docs/                 # Documentación del proyecto
│   └── ROADMAP.md        # Plan de escalabilidad
│
└── README.md
```

---

## 🚀 Cómo Ejecutar el Prototipo

### Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```

### App Flutter
```bash
cd app
flutter pub get
flutter run
```

---

## 👥 Equipo

Proyecto desarrollado como prototipo académico por estudiantes, con visión de escalabilidad hacia una solución real para las comunidades indígenas del Magdalena, Colombia.

---

## 📄 Licencia

MIT License — libre para uso académico y comunitario.
