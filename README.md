# Pragma Catbreeds

App Flutter que consume [TheCatAPI](https://thecatapi.com/) para buscar razas de gatos y ver el detalle de cada una (origen, temperamento, esperanza de vida, nivel de inteligencia/adaptabilidad/afecto, etc.), con paginación infinita, búsqueda con debounce e internacionalización.

Proyecto de prueba técnica construido con **Clean Architecture** (domain / data / presentation), MVVM en la capa de presentación e inyección de dependencias con `get_it`.

## Requisitos

- Flutter `3.47.4` (canal stable) — Dart SDK `^3.13.3`
- Un API key gratuita de [TheCatAPI](https://thecatapi.com/) para los flavors `dev`/`prod`

## Puesta en marcha

1. Instalar dependencias:

   ```bash
   flutter pub get
   ```

2. Crear un archivo `.env` en la raíz del proyecto con tu API key:

   ```
   CAT_API_KEY=tu_api_key_de_thecatapi
   ```

   El flavor `mock` no la necesita (usa datos falsos, no llama a la API real).

3. Correr el flavor que necesites (ver [Flavors](#flavors) abajo).

## Arquitectura

El código en `lib/` está organizado en tres capas, siguiendo la regla de dependencia de Clean Architecture: `domain` no conoce a `data` ni a `presentation`; las otras dos capas dependen de `domain`, nunca al revés.

```
lib/
├── domain/           # Reglas de negocio puras, sin Flutter ni HTTP
│   ├── entities/      # CatEntity, SearchResultEntity<T>, PetitionStatusEntity<T>...
│   ├── repositories/  # Contratos abstractos (CatRepository, LocalizationRepository)
│   ├── use_cases/     # Un caso de uso = una operación de negocio (SearchCatsUseCase...)
│   ├── states/        # Contratos de estado transversal (LocalizationState)
│   └── contstants/    # Claves de error compartidas (ErrorsConstants)
│
├── data/             # Implementación concreta de los contratos de domain
│   ├── repositories/  # Implementaciones por flavor (Impl / Dev / Mock) de cada repo
│   ├── dtos/           # Mapeo JSON -> Entity (CatDto.fromJSON)
│   └── settings/       # Cliente HTTP base (RestApi) y su configuración por API (CatApi)
│
├── presentation/     # UI + estado de UI, con Provider como mecanismo de notificación
│   ├── ui/pages/       # Cada pantalla: Page (StatefulWidget) + Screen (UI) + ViewModel
│   ├── ui/widgets/      # Widgets reutilizables (loaders, imágenes con caché, etc.)
│   ├── ui/utils/        # ViewModel base + adaptador para conectarlo a Provider
│   ├── ui/theme/        # Temas claro/oscuro
│   └── states/          # Implementación concreta de LocalizationState
│
├── flavors/          # Definición de los flavors (mock/dev/prod)
└── dependency_injection.dart  # Registro de todo en GetIt, varía según el flavor activo
```

### Patrón de cada pantalla (Page / Screen / ViewModel)

Cada pantalla se divide en tres archivos con una responsabilidad única:

- **`*_page.dart`**: `StatefulWidget` que solo crea el `ViewModel` (vía `StfViewModelAdapter`) y lo inyecta con `Provider`.
- **`*_page_view_model.dart`**: extiende `ViewModel<T>` (un `ChangeNotifier`), llama a los `UseCase` correspondientes y expone el estado a la UI.
- **`*_page_screen.dart`**: `StatelessWidget` puro que lee el `ViewModel` con `context.watch<T>()` y solo dibuja UI — no conoce casos de uso ni repositorios.

`StfViewModelAdapter` ([stf_view_model_adapter.dart](lib/presentation/ui/utils/stf_view_model_adapter.dart)) es el pegamento que evita repetir el boilerplate de `ChangeNotifierProvider` + `Consumer` en cada pantalla.

### Manejo de resultados asíncronos: `PetitionStatusEntity<T>`

En vez de exponer `Future<T>` crudo, los repositorios devuelven `PetitionStatusEntity<T>` ([petition_status_entity.dart](lib/domain/entities/petition_status_entity.dart)): un wrapper con `status` (`loading` / `complete` / `failed` / `notStarted`), `data` y `error`. Esto permite que la UI represente los cuatro estados de una petición de forma explícita, sin `FutureBuilder`s repetidos por pantalla.

`LoaderScreenWidget<T>` ([loader_screen_widget.dart](lib/presentation/ui/widgets/loaders_status/loader_screen_widget.dart)) es el widget que traduce ese estado en UI (loading / error con retry / sin resultados / contenido). Su `builder` recibe el dato **ya desenvuelto y no nulo** (`Widget Function(BuildContext, T data)`), así las pantallas nunca hacen `data!`.

### Manejo de errores

La clasificación de errores de transporte (timeout, sin internet, 401, 404, etc.) vive únicamente en la capa `data` ([rest_api.dart](lib/data/settings/rest_api.dart)), que traduce excepciones de red a claves de [`ErrorsConstants`](lib/domain/contstants/errors_constants.dart). El dominio (`PetitionStatusEntity.fromError`) no conoce `SocketException`, `TimeoutException` ni códigos HTTP — solo sabe formatear un estado de error a partir de una clave ya clasificada, con fallback a un error genérico traducible para no filtrar texto de excepciones crudas a la UI.

## Flavors

El proyecto usa `flutter_flavorizr` con tres flavors, cada uno con su propio `applicationId`/`bundleId` y nombre de app:

| Flavor | Repositorios usados | Uso |
|---|---|---|
| `mock` | `CatRepositoryMock`, `LocalizationRepositoryMock` | Desarrollo de UI sin backend, datos falsos e instantáneos |
| `dev` | `CatRepositoryDev` (TheCatAPI real) | Desarrollo contra la API real |
| `prod` | `CatRepositoryImpl` (TheCatAPI real) | Build de producción |

El flavor activo se lee en runtime desde la variable global `appFlavor` de `package:flutter/services.dart`, que Flutter puebla automáticamente (vía `--dart-define=FLUTTER_APP_FLAVOR`) al usar `--flavor` — no hace falta pasarla a mano. Ese valor determina qué implementación registra [`DependencyInjection`](lib/dependency_injection.dart) en `GetIt`, así cada capa superior solo depende de las interfaces de `domain`, nunca sabe qué implementación concreta está corriendo.

Correr cada flavor:

```bash
flutter run --flavor mock -t lib/main.dart
flutter run --flavor dev -t lib/main.dart
flutter run --flavor prod -t lib/main.dart
```

También hay configuraciones equivalentes en [.vscode/launch.json](.vscode/launch.json) para correr/depurar cada flavor desde VS Code, y schemes de Xcode (`mock`/`dev`/`prod`) para iOS.

## Internacionalización

Las traducciones viven como JSON en `assets/translate_dictionaries/<locale>.json` (hoy solo `es.json`). `LocalizationRepository` las carga y `LocalizationState` expone `translate(key, {values})`, con soporte de interpolación (`{version}`, `{build}`, etc.). El idioma preferido se persiste con `shared_preferences`.

## Paquetes principales

- **Estado / DI**: `provider`, `get_it`
- **Networking**: `http`, `flutter_dotenv` (API key)
- **Listas**: `infinite_scroll_pagination`
- **Imágenes**: `flutter_cache_manager`, `flutter_svg`
- **Flavors**: `flutter_flavorizr`
- **Otros**: `lottie` (splash), `package_info_plus`, `shared_preferences`

## Limitaciones conocidas / próximos pasos

- No hay tests automatizados todavía (unitarios de `UseCase`/mapeo de errores, ni de widgets). Es lo primero que agregaría con más tiempo.
- Solo hay un idioma cargado (`es`); la infraestructura de i18n ya soporta agregar más `*.json` sin tocar código.
- El API key de TheCatAPI se distribuye dentro del bundle vía `.env`; para producción real lo correcto sería servirlo desde un backend propio en vez de embeberlo en el cliente.
