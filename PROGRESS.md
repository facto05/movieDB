# MovieDB - Progress Tracking & Improvement Plan

## Project Overview
Flutter movie discovery app using TMDB API with BLoC pattern.

---

## Current Stack
- Flutter 3.x
- flutter_bloc: ^8.1.6
- http: ^1.1.0
- cupertino_icons: ^1.0.2

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

### Phase 4: UI/UX with shadcn_flutter (Priority: MEDIUM)
- [ ] Add `shadcn_flutter` dependency
- [ ] Create custom theme (light/dark)
- [ ] Replace Material components with shadcn equivalents:
  - [ ] `Card` → `ShadCard`
  - [ ] `Button` → `ShadButton`
  - [ ] `AppBar` → `ShadAppBar`
  - [ ] `Dialog` → `ShadDialog`
  - [ ] `SnackBar` → `ShadToast`
  - [ ] `CircularProgressIndicator` → `ShadSpinner`
  - [ ] `TextField` → `ShadInput`
- [ ] Add shimmer loading skeleton components
- [ ] Add error/retry state widgets
- [ ] Implement dark mode toggle

### Phase 5: Polish & Testing (Priority: LOW)
- [ ] Add unit tests for models & API parsing
- [ ] Add widget tests for key screens
- [ ] Performance optimization (image caching, list virtualization)

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

---

## Next Action
Start **Phase 4**: UI/UX with shadcn_flutter.