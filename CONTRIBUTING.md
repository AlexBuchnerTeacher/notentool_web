# Beitragen zu InduScore

Vielen Dank für deinen Beitrag! So gehst du vor:

## Vor dem Start
- Richte das Projekt ein: `flutter pub get`
- Stelle sicher, dass Firebase korrekt konfiguriert ist (siehe README).

## Entwicklungs-Workflow
1. **Branch**: Feature/Fix auf eigenem Branch (`feature/*` oder `fix/*`).
2. **Analyze**: `flutter analyze`
3. **Tests**: `flutter test` (sofern sinnvoll)
4. **Versionierung**: `pubspec.yaml`, `VERSION`, `lib/version.dart` synchron halten.

## Pull Requests
- PR-Template ausfüllen (Zusammenfassung, Checks, Testnotizen).
- Screenshots/GIFs bei UI-Änderungen ablegen.
- Akzeptanzkriterien der verlinkten Issues beachten.

## Releases
- Tags im Format `v*` triggern den Release-Workflow (Web-Build als Asset).
- CHANGELOG bei Bedarf aktualisieren.

## Code-Stil
- RBS Styleguide-UI einhalten.
- Kurze, aussagekräftige Texte (deutsch), Umlaute korrekt.
