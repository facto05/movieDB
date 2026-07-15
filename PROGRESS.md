# MovieDB - Progress Tracking & Improvement Plan

## Project Overview
Flutter movie discovery app using TMDB API with BLoC pattern.

---

## Current Stack
- Flutter 3.x
- flutter_bloc: ^8.1.6
- http: ^1.1.0
- cupertino_icons: ^1.0.2
- shadcn_flutter: ^0.1.0

---

## Issues Found

### 🔴 CRITICAL - Security & Architecture

| ID | Issue | Location | Impact |
|---|---|---|---|
| SEC-01 | API Key hardcoded | `lib/utils/constant.dart:2` | Exposed in repo |
| SEC-02 | Bearer token hardcoded in 6 services | `lib/service/*.dart` | Token expired = total failure |
| ARC-01 | Inconsistent HTTP clients | `get_now_playing_service.dart` vs others | Maintenance burden |
| ARC-02 | Usecase layer is dead weight | `lib/usecase/*.dart` | Unnecessary abstraction |

### 🟠 HIGH - Bugs

| ID | Issue | Location | Impact |
|---|---|---|---|
| BUG-01 | Typo in `copyWith` param | `home_state.dart:20` | `nowPlayingMovie` ignored |
| BUG-02 | Hardcoded loop limit 6 | `get_now_playing_usecase.dart:6` | Crash if API returns <6 |
| BUG-03 | Hardcoded loop limit 20 | `get_popular_movie_usecase.dart:6` | Crash if API returns <20 |
| BUG-04 | Force unwrap nullable | `movie_detail_bloc.dart:30` | Crash on null similar movies |
| BUG-05 | Error handling swallows exceptions | All services | Silent failures |

### 🟡 MEDIUM - Code Quality

| ID | Issue | Location |
|---|---|---|
| QUAL-01 | Mutable model fields | `model/movie.dart` |
| QUAL-02 | No `fromJson` factory on Movie | `model/movie.dart` |
| QUAL-03 | Duplicate JSON parsing in 4 usecases | `usecase/*.dart` |
| QUAL-04 | No loading/error states in UI | All screens |
| QUAL-05 | `flutter_lints` basic config | `analysis_options.yaml` |

### 🟢 LOW - UI/UX

| ID | Issue |
|---|---|
| UI-01 | Default Material theme only |
| UI-02 | No dark mode support |
| UI-03 | No shimmer loading skeletons |
| UI-04 | No error/retry widgets |
| UI-05 | Basic snackbars only |

---

## Improvement Plan

### Phase 1: Security & Foundation (Priority: CRITICAL) ✅
- [x] Move API key & token to `--dart-define` / env config
- [x] Create single `ApiClient` service using `http` package
- [x] Remove all hardcoded tokens from service files
- [x] Delete `lib/usecase/` folder entirely
- [x] Add `fromJson` factory constructors to `Movie` & `MovieDetail`

### Phase 2: Bug Fixes (Priority: HIGH) ✅
- [x] Fix `home_state.dart` typo (`nomPlayingMovie` → `nowPlayingMovie`)
- [x] Replace hardcoded loops with `data.length` checks
- [x] Add null checks before force unwrap
- [x] Proper error handling with exceptions

### Phase 3: Model & State Improvements (Priority: MEDIUM) ✅
- [x] Make model fields `final`
- [x] Add `copyWith` to models
- [x] Implement proper loading/error states in all BLoCs
- [x] Upgrade `analysis_options.yaml` to stricter lints

### Phase 4: UI/UX with shadcn_flutter (Priority: MEDIUM) ✅
- [x] Add `shadcn_flutter` dependency
- [x] Create custom theme (light/dark)
- [x] Replace Material components with shadcn equivalents:
  - [x] `Card` → `ShadCard`
  - [x] `Button` → `ShadButton`
  - [x] `AppBar` → `ShadAppBar`
  - [x] `Dialog` → `ShadDialog`
  - [x] `SnackBar` → `ShadToast`
  - [x] `CircularProgressIndicator` → `ShadSpinner`
  - [x] `TextField` → `ShadInput`
- [x] Add shimmer loading skeleton components
- [x] Add error/retry state widgets
- [x] Implement dark mode toggle

### Phase 5: Search & Filter (Priority: HIGH)
- [ ] Search movies by title (`/search/movie`)
- [ ] Genre filter (fetch `/genre/movie/list`, chips UI)
- [ ] Toggle add/remove from favorites & watchlist
- [ ] Search page with BLoC pattern
- [ ] Debounced search input

### Phase 6: Movie Details Enhancement (Priority: HIGH)
- [ ] Cast & crew info (`/movie/{id}/credits`)
- [ ] Actors page with filmography
- [ ] Trailers (`/movie/{id}/videos`, YouTube player)
- [ ] Reviews (`/movie/{id}/reviews`)
- [ ] Vote count & popularity display

### Phase 7: More Categories (Priority: MEDIUM)
- [ ] Upcoming movies (`/movie/upcoming`)
- [ ] Top Rated movies (`/movie/top_rated`)
- [ ] Pagination for all movie lists
- [ ] Tab navigation for categories

### Phase 8: Polish (Priority: LOW)
- [ ] Infinite scroll / load more
- [ ] Share movie (`share_plus`)
- [ ] Local caching (`cached_network_image`)
- [ ] Actor pages with filmography

---

## New Dependencies (Phase 5-8)

```yaml
share_plus: ^7.0.0              # Share movie details
cached_network_image: ^3.3.0    # Image caching & placeholders
youtube_player_flutter: ^8.0.0  # Play trailers
```

---

## New Files Structure (Phase 5-8)

```
lib/
├── model/
│   ├── movie.dart
│   ├── cast.dart              ← NEW
│   ├── trailer.dart           ← NEW
│   ├── review.dart            ← NEW
│   └── genre.dart             ← NEW
├── screen/
│   ├── Search/
│   │   ├── search_page.dart   ← NEW
│   │   ├── search_bloc.dart   ← NEW
│   │   ├── search_event.dart  ← NEW
│   │   └── search_state.dart  ← NEW
│   ├── Cast/
│   │   ├── cast_page.dart     ← NEW
│   │   └── cast_bloc.dart     ← NEW
│   └── ...
├── widget/
│   ├── card_cast_member.dart  ← NEW
│   ├── card_trailer.dart      ← NEW
│   ├── card_review.dart       ← NEW
│   └── genre_chip.dart        ← NEW
└── service/
    ├── api_client.dart
    ├── get_search_service.dart    ← NEW
    ├── get_cast_service.dart      ← NEW
    ├── get_trailers_service.dart  ← NEW
    ├── get_reviews_service.dart   ← NEW
    ├── get_genres_service.dart    ← NEW
    ├── get_upcoming_service.dart  ← NEW
    └── get_top_rated_service.dart ← NEW
```

---

## shadcn_flutter Integration Notes

### Installation
```yaml
dependencies:
  shadcn_flutter: ^0.1.0
  flutter:
    sdk: flutter
```

### Theme Setup
```dart
// lib/theme/app_theme.dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

final lightTheme = ShadThemeData.light();
final darkTheme = ShadThemeData.dark();
```

### Component Mapping
| Material | shadcn_flutter |
|---|---|
| `Scaffold` | `ShadScaffold` |
| `AppBar` | `ShadAppBar` |
| `Card` | `ShadCard` |
| `ElevatedButton` | `ShadButton` |
| `IconButton` | `ShadButton.icon` |
| `Text` | `ShadText` |
| `TextField` | `ShadInput` |
| `Dialog` | `ShadDialog` |
| `SnackBar` | `ShadToast` / `ShadAlert` |
| `CircularProgressIndicator` | `ShadSpinner` |
| `Divider` | `ShadSeparator` |
| `ListTile` | `ShadListTile` |

---

## Progress Log

| Date | Phase | Status | Notes |
|---|---|---|---|
| 2026-07-15 | Audit | ✅ Complete | All issues documented |
| 2026-07-15 | Phase 1 | ✅ Complete | Security & Foundation refactored |
| 2026-07-15 | Phase 2 | ✅ Complete | All bugs fixed |
| 2026-07-15 | Phase 3 | ✅ Complete | Models & states improved |
| 2026-07-15 | Phase 4 | ✅ Complete | UI/UX overhaul with shadcn_flutter |
| 2026-07-15 | Phase 5 | ⏳ Pending | Search & Filter |
| 2026-07-15 | Phase 6 | ⏳ Pending | Movie Details Enhancement |
| 2026-07-15 | Phase 7 | ⏳ Pending | More Categories |
| 2026-07-15 | Phase 8 | ⏳ Pending | Polish |

---

## Next Action
Fix `flutter pub get` error, then start Phase 5: Search & Filter.