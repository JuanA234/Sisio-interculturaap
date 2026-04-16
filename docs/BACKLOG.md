# 📋 Backlog — Sisio interculturaap (Fase 1 · Prototipo Académico)

> Período: 3 abril – 28 mayo de 2026 · ~7.5 semanas
> Metodología: Iteraciones semanales con entregable por semana

---

## 🗂️ Épicas

| ID | Épica | Descripción |
|---|---|---|
| E1 | Infraestructura base | Configuración del repositorio, backend y base de datos |
| E2 | Reconocimiento por audio | Integración de BirdNET en el backend |
| E3 | Reconocimiento por foto | Integración de iNaturalist API en el backend |
| E4 | Contenido ancestral | Fichas de las 5 aves en Supabase |
| E5 | App Flutter | Pantallas e integración con el backend |
| E6 | Pruebas y entrega | QA, ajustes y presentación final |

---

## 📌 Historias de Usuario

### E1 · Infraestructura Base

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-01 | Como desarrollador, quiero tener el repositorio estructurado para que el equipo pueda trabajar en paralelo. | Repositorio con carpetas `app/`, `backend/`, `docs/` y archivos base. | 🔴 Alta | 2 |
| US-02 | Como desarrollador, quiero el backend FastAPI corriendo localmente para poder conectar los servicios. | `GET /` retorna `{"status": "ok"}`. | 🔴 Alta | 2 |
| US-03 | Como desarrollador, quiero la base de datos en Supabase creada con la tabla `aves` para almacenar las fichas. | Tabla `aves` con todos los campos definidos y accesible desde el backend. | 🔴 Alta | 2 |
| US-04 | Como desarrollador, quiero variables de entorno configuradas para no exponer credenciales en el código. | Archivo `.env.example` documentado, `.env` en `.gitignore`. | 🔴 Alta | 2 |

---

### E2 · Reconocimiento por Audio

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-05 | Como usuario, quiero grabar el canto de un ave para que la app lo identifique. | El endpoint `POST /audio/identify` recibe un archivo WAV y retorna un nombre científico. | 🔴 Alta | 3 |
| US-06 | Como desarrollador, quiero que BirdNET use coordenadas del Magdalena para mejorar la precisión. | El servicio `birdnet.py` pasa `lat=10.9878, lon=-74.7889` al análisis. | 🟡 Media | 3 |
| US-07 | Como usuario, quiero recibir un mensaje claro si el audio no corresponde a un ave reconocible. | Si BirdNET no detecta nada, el endpoint retorna 404 con mensaje descriptivo. | 🟡 Media | 3 |

---

### E3 · Reconocimiento por Foto

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-08 | Como usuario, quiero tomar una foto de un ave para que la app la identifique. | El endpoint `POST /photo/identify` recibe una imagen y retorna un nombre científico. | 🔴 Alta | 4 |
| US-09 | Como usuario, quiero poder subir una foto de mi galería además de usar la cámara. | La app permite seleccionar imagen desde cámara o galería. | 🟡 Media | 4 |
| US-10 | Como usuario, quiero recibir un mensaje claro si la foto no permite identificar el ave. | Si iNaturalist no retorna resultados, el endpoint retorna 404 con mensaje descriptivo. | 🟡 Media | 4 |

---

### E4 · Contenido Ancestral

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-11 | Como gestor de contenido, quiero una tabla en Supabase que almacene la ficha completa de cada ave. | Tabla `aves` con campos: `nombre_cientifico`, `nombre_espanol`, `nombre_nativo`, `lengua`, `significado_ancestral`, `rol_cosmovision`, `habitat`, `imagen_url`, `audio_url`. | 🔴 Alta | 3 |
| US-12 | Como miembro del equipo de investigación, quiero cargar las fichas de las 5 aves en Supabase. | Las 5 aves están cargadas y el endpoint las retorna correctamente. | 🔴 Alta | 4-5 |
| US-13 | Como usuario, quiero ver el nombre del ave en la lengua indígena local junto con su significado. | La ficha muestra `nombre_nativo`, `lengua` y `significado_ancestral`. | 🔴 Alta | 5 |

---

### E5 · App Flutter

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-14 | Como usuario, quiero ver una pantalla de inicio clara con las opciones de "Foto" y "Sonido". | Pantalla Home con dos botones funcionales. | 🔴 Alta | 4 |
| US-15 | Como usuario, quiero capturar o seleccionar una foto y enviarla al backend para identificación. | Flujo completo: abrir cámara → tomar foto → enviar → recibir resultado. | 🔴 Alta | 5 |
| US-16 | Como usuario, quiero grabar el canto de un ave desde la app y enviarlo al backend. | Flujo completo: iniciar grabación → detener → enviar → recibir resultado. | 🔴 Alta | 5 |
| US-17 | Como usuario, quiero ver la ficha ancestral del ave identificada en una pantalla clara. | Pantalla de detalle con: nombre, foto, nombre nativo, significado ancestral y hábitat. | 🔴 Alta | 5-6 |
| US-18 | Como usuario, quiero ver un mensaje amigable cuando el ave no pudo ser identificada. | Pantalla de error con mensaje claro y botón para intentar de nuevo. | 🟡 Media | 6 |
| US-19 | Como usuario, quiero que la app sea usable por personas con poca experiencia digital. | Íconos grandes, texto legible, flujo máximo de 3 pasos para llegar al resultado. | 🟡 Media | 6 |

---

### E6 · Pruebas y Entrega

| ID | Historia | Criterio de Aceptación | Prioridad | Semana |
|---|---|---|---|---|
| US-20 | Como equipo, queremos probar la app con personas ajenas al proyecto. | Al menos 3 personas externas usan la app y dan retroalimentación documentada. | 🔴 Alta | 7 |
| US-21 | Como equipo, queremos corregir los errores encontrados en las pruebas. | Bugs críticos resueltos antes de la semana 9. | 🔴 Alta | 7-8 |
| US-22 | Como equipo, queremos preparar el video de demostración del prototipo. | Video de máx. 3 minutos mostrando el flujo completo de la app. | 🔴 Alta | 9 |
| US-23 | Como equipo, queremos tener la documentación técnica lista para la entrega. | README, ROADMAP y comentarios en el código actualizados. | 🟡 Media | 9 |

---

## 🗓️ Distribución por Semana

```
Semana 2  (4-8 abr)    │ US-01, US-02, US-03, US-04
Semana 3  (9-15 abr)   │ US-05, US-06, US-07, US-11
Semana 4  (16-22 abr)  │ US-08, US-09, US-10, US-14
Semana 5  (23-29 abr)  │ US-12, US-13, US-15, US-16
Semana 6  (30 abr-6 may)│ US-17, US-18, US-19
Semana 7  (7-13 may)   │ US-20, US-12 (ajustes de contenido)
Semana 8  (14-20 may)  │ US-21 (corrección de bugs)
Semana 9  (21-28 may)  │ US-22, US-23
```

---

## 🚦 Definición de Terminado (DoD)

Una historia de usuario se considera terminada cuando:

- ✅ La funcionalidad está implementada y probada localmente.
- ✅ No introduce errores en funcionalidades ya terminadas.
- ✅ El código está comentado en los puntos no obvios.
- ✅ Ha sido revisada por al menos otro miembro del equipo.

---

## ⚠️ Historias Fuera del Alcance (Fase 1)

Estas historias fueron identificadas pero **no se incluyen en el prototipo**:

- Modo offline / funcionamiento sin internet.
- Autenticación de usuarios.
- Múltiples lenguas indígenas simultáneas.
- Catálogo navegable de todas las aves.
- Gamificación o funciones sociales.
- Panel de administración de contenido.
