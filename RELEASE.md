# Release Checklist

## Vor dem Release
- Version synchron: `pubspec.yaml`, `VERSION`, `lib/version.dart`
- CHANGELOG/README aktualisiert (Features, bekannte Punkte)
- CI grün: `flutter analyze`, `flutter test`
- Manuell geprüft: Login/Logout, Klassen/Fächer CRUD, Navigation über Drawer, Responsives Layout, Firestore-Operationen


## Build & Tag v0.3.0
```bash
flutter build web --release --web-renderer html
git checkout gh-pages
cp -r build/web/* .
git add .
git commit -m "Deploy v0.3.0 to GitHub Pages"
git push origin gh-pages
git checkout feature/faecherverwaltung
git tag -a v0.3.0 -m "Release v0.3.0"
git push origin v0.3.0
```
- Optional: Test-Tag (z.B. `v0.3.0-rc1`), um den Release-Workflow zu verifizieren

## GitHub Release
- Release-Workflow (`.github/workflows/release.yml`) hängt `web-release.zip` an den GitHub Release
- Release Notes für v0.3.0:

### Release v0.3.0 - Fächerverwaltung & Bugfixes

#### Neue Features
- Fächerverwaltung mit CRUD, Filter, Farbcodierung
- RBS Styleguide 1.2 UI

#### Bugfixes
- Umlaut- und Encoding-Probleme
- Save-Dialog und Firestore-Integration

#### Änderungen
- Google Fonts (Roboto)
- Firestore-Regeln für Auth-User

## Firestore Security Rules (Beispiel)
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Release Notes Template (GitHub)
```markdown
# Release vX.Y.Z - Titel

## Neue Features
- Punkt 1
- Punkt 2

## Bug Fixes
- Fix 1
- Fix 2

## Technisch
- CI/Release-Änderungen
- Abhängigkeiten aktualisiert

## Download
Das Web-Build-Asset liegt dem Release als `web-release.zip` bei.
```

## Post-Release
- GitHub Release erstellt und Asset vorhanden
- Prod-URL getestet
- Team informiert
