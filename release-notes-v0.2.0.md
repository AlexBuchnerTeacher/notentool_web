# 🎉 Release v0.2.0 - Klassenverwaltung & Navigation

## ✨ Neue Features

### 📚 Klassenverwaltung
- Vollständige CRUD-Funktionalität für Klassen
- Vereinfachte Eingabe: "EAT321" wird automatisch geparst
- Filter nach Schuljahr und Beruf (Chips)
- Farbcodierte Beruf-Anzeige:
  - 🔴 IE (Industrieelektroniker) - Dynamic Red
  - 🟢 EAT (Automatisierungstechnik) - Court Green
  - 🟣 EBT (Betriebstechnik) - Growing Elder
  - 🔵 EGS (Geräte und Systeme) - Blue
- Empty-State mit "Erste Klasse erstellen" Button
- Löschen mit Bestätigung (Warnung vor Cascade-Delete)

### 🏗 Domain-Modelle
- **Beruf Enum**: IE, EAT, EBT, EGS mit vollständigen Namen
- **Schuljahr**: Auto-Erkennung aktuelles Jahr (Aug-Dez = aktuell)
- **Zeitgruppe**: 1, 2, 3 für Nachschreiber-Management
- **Klasse**: Format "EAT321" (Beruf + Jahrgangsstufe + Zeitgruppe + Lfd.Nr.)
- **Leistungsnachweis**: Typen mit Gewichtung (Schulaufgabe 2.0x, etc.)
- **IHK Bayern Notenschlüssel**: 92%+=1, 81%+=2, 67%+=3, 50%+=4, 30%+=5, <30%=6
- **Zeugnisnote**: Gewichteter Durchschnitt + Rundung (2.5→2, 2.6→3)

### 🧭 Navigation System
- RBS Drawer-Menü mit Dynamic Red Header
- User-Email Anzeige im Drawer
- Navigation zu: Dashboard, Klassen (aktiv)
- Kommend: Schüler, Fächer, Noten, Statistiken, Einstellungen
- Logout-Funktion im Drawer
- Aktive Seite visuell hervorgehoben (rot + fett)

## 🐛 Bug Fixes
- Layout-Overflow in HomeScreen behoben (Card-Größe: 180→200px)
- Enter-Taste triggert Login-Funktion
- Deprecated `value` Parameter → `initialValue`
- Unused Imports bereinigt

## 🔧 Technische Verbesserungen
- Firebase Firestore Integration erweitert
- Riverpod Providers für neue Collections
- RBS Styleguide 1.2 durchgängig umgesetzt
- Code formatiert & analysiert (0 Issues)

## 📦 Installation

```bash
git clone https://github.com/AlexBuchnerTeacher/notentool_web.git
cd notentool_web
flutter pub get
flutterfire configure
flutter run -d chrome
```

Siehe [INSTALL.md](INSTALL.md) für detaillierte Anweisungen.

## 🚀 Nächste Schritte (v1.0.0)

- Schülerverwaltung mit CSV-Import & Pseudonymisierung
- Fächerverwaltung mit Beruf-Zuordnung
- Leistungsnachweise & Noteneingabe
- Automatische Zeugnisnoten-Berechnung
- Nachschreiber-Management mit Zeitgruppen
- PDF-Export für Notenlisten & Zeugnisse

---

**Full Changelog**: https://github.com/AlexBuchnerTeacher/notentool_web/compare/v0.1.0...v0.2.0
