<div align="center">

<img src="branding/logos/app-icon/harmonix-app-icon-red.svg" width="140" alt="Harmonix Logo" />

# Harmonix

**Multi-Source HD Music Streaming · Synced Live Lyrics · AI Sing-Along · Offline Downloads**  
*Native Android App · Electron Desktop (Windows) · Encrypted Cloud Sync & Universal Sharing*

[![Kotlin](https://img.shields.io/badge/Kotlin-2.1-7F52FF?style=flat-square&logo=kotlin&logoColor=white)](https://kotlinlang.org)
[![Electron](https://img.shields.io/badge/Electron-33-47848F?style=flat-square&logo=electron&logoColor=white)](https://www.electronjs.org)
[![React](https://img.shields.io/badge/React-18-61DAFB?style=flat-square&logo=react&logoColor=black)](https://react.dev)
[![Jetpack Compose](https://img.shields.io/badge/Jetpack_Compose-Material_3-4285F4?style=flat-square&logo=jetpackcompose&logoColor=white)](https://developer.android.com/jetpack/compose)
[![Platform](https://img.shields.io/badge/Android_%26_Windows-3DDC84?style=flat-square&logo=android&logoColor=white)](https://www.android.com)
[![Release](https://img.shields.io/github/v/release/NandiVardhan2007/Harmonix-Releases?style=flat-square&color=FF0033)](https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest)
[![License](https://img.shields.io/badge/License-Proprietary-red?style=flat-square)](LICENSE)

<br/>

[**Download**](#download) · [**Quick Install (Windows)**](#quick-install-windows-powershell) · [**Features**](#features) · [**Desktop Version**](#harmonix-desktop-electron) · [**Tech Stack**](#tech-stack) · [**Build**](#build-from-source) · [**License**](#license)

</div>

<br/>

---

## Download

<div align="center">

<a href="https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest/download/Harmonix-Android.apk">
<img src="https://img.shields.io/badge/Android-Download_APK-FF0033?style=for-the-badge&logo=android&logoColor=white" alt="Android APK" height="44"/>
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest/download/Harmonix-Setup.exe">
<img src="https://img.shields.io/badge/Windows-Download_Setup.exe-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Setup" height="44"/>
</a>

</div>

<br/>

- **Android Mobile**: Native application built with **Jetpack Compose** and **Media3**. Requires **Android 7.0 (API 24)** or newer. Sideload the APK on your device; the built-in SHA-256 verified auto-updater checks the public releases repository and keeps your installation up to date.
- **Windows Desktop**: Native Electron JS desktop application featuring hardware-accelerated Web Audio DSP, frameless glassmorphism design, system media key controls, camera QR code mobile linking, and automated GitHub release update verification.

---

## Quick Install (Windows PowerShell)

Install or update Harmonix on Windows instantly by running the following one-line command in Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix/main/install.ps1 | iex
```

The script automatically queries the latest public release from `NandiVardhan2007/Harmonix-Releases`, downloads `Harmonix-Setup.exe`, and initiates the installation wizard.

---

## Features

### Core Audio & Playback Engine

| Feature | Description |
|:---|:---|
| **Multi-Source Streaming** | Aggregates JioSaavn (320kbps lossless with DES-ECB decryption), Audius, and YouTube Music |
| **0ms Gapless Prefetching** | High-performance audio engine pre-resolving and caching the next song ahead of time |
| **Dynamic Color Theming** | Ambient UI dynamically extracts artwork palettes and renders smooth gradient meshes |
| **Fluid Navigation & Shelves** | Spotify & Apple Music inspired artwork swipe gestures and smooth horizontal shelf carousels |
| **Bluetooth Audio Routing** | Instant hardware detection for Bluetooth A2DP headsets, SCO, and system audio outputs |
| **Multi-Band Equalizer** | Native parametric EQ with Bass Boost, Virtualizer, Loudness Enhancer, and custom presets |
| **Offline Downloads** | Download tracks up to 320kbps with embedded cover artwork, metadata tags, and LRC lyrics |
| **Smart Infinite Queue** | Taste-aware autoplay algorithm recommending similar tracks when your queue finishes |

---

### Synchronized Lyrics & AI Sing-Along

- **Auto-Adjusting Home Widget (Android)**: Responsive launcher widget (2x1, 4x1, 2x2, 4x2, 5x2, 4x3) featuring the signature **"Long Wing"** mode with real-time synchronized live lyrics and 1-tap jump to full-screen lyrics.
- **Multilingual Phonetic Sing-Along**: Transliterates songs in 20 languages into authentic native script characters (Telugu `తెలుగు`, Hindi `हिन्दी`, Tamil `தமிழ்`, Kannada `ಕನ್ನಡ`, Malayalam `മലയാളം`, etc.) as well as English Latin romanization.
- **Dynamic Timing Calibration**: Visual live sync offset adjustment (±ms) with local calibration memory per track.
- **Interactive Tap-to-Seek**: Tap any lyric line to jump the audio playback directly to that timestamp.
- **Lyrics Cards**: Create and export lyric quote cards with custom colors and artwork backgrounds.

---

### Cloud Sync & Multi-Device Sessions

| Feature | Description |
|:---|:---|
| **Camera QR Code Scanner** | Link Desktop from Android in 1 second by scanning Desktop's on-screen QR code with the integrated Google Play services code scanner |
| **Strict Playback Auth** | Playback requires an authenticated Harmonix account across all platforms to protect personal libraries, history, and favorites |
| **Multi-Device Session Tracking** | View and manage all active sessions (device name, platform, IP address, and last active timestamp) across Mobile and Desktop |
| **Remote Session Revocation** | Disconnect and sign out unrecognized or remote sessions from your phone with 1 tap |
| **Bidirectional Cloud Sync** | Encrypted MongoDB cloud synchronization for playlists, liked tracks, and listening history |
| **Public Release Auto-Updater** | Built-in updater monitors the public releases mirror (`NandiVardhan2007/Harmonix-Releases`) for instant 1-click upgrades |
| **Universal Share Links** | Share song deep-links with open preview landing pages that resolve on any device or music platform |

---

## Harmonix Desktop (Electron)

The desktop edition located in [`desktop/`](desktop/) provides a full-featured desktop experience matching the mobile version:

- **Local HTTP Origin (`http://localhost:42800`)**: Eliminates `file:///` restrictions, enabling standard Google OAuth popups and Firebase Authentication.
- **Horizontal Shelf Smooth Scrolling**: Converts vertical mouse wheel deltas (`deltaY`) to smooth horizontal scroll (`scrollLeft`) with floating chevron navigation controls.
- **Live Discover Experience**: Automatically populates real-time 320kbps trending superhits, popular movie soundtracks, genre chips, and in-page multi-engine search.
- **Windows System Integrations**: Frameless sleek window controls, persistent bottom player, taskbar thumbnail controls, and native audio downloads.

---

## Tech Stack

```
Mobile (Android)
  Language         Kotlin 2.1
  UI Engine        Jetpack Compose · Material 3 · Motion & Navigation Compose
  Audio Engine     Media3 (ExoPlayer + MediaSessionService)
  Scanner          Google Play Services Code Scanner (Auto-capture ML Kit)
  State & DI       ViewModel + StateFlow · Hilt
  Storage          DataStore Preferences · Room · SharedPreferences

Desktop (Windows)
  Runtime          Electron 33 · Node.js 20+
  Frontend         React 18 · Vite · Tailwind CSS v4
  Audio Engine     Web Audio API (10-Band Parametric EQ & -14 LUFS Limiter)
  Crypto           CryptoJS DES-ECB Decryption Engine

Cloud & Backend
  API Server       Node.js 20+ · Express 4 (ES modules) · Helmet
  Database         MongoDB Atlas (UID-scoped library and session documents)
  Auth             Firebase Admin SDK (ID token verification & custom tokens)
  AI Engines       Groq · OpenRouter · NVIDIA NIM · Google Input Tools
```

---

## Project Directory Structure

```
Harmonix/
├── install.ps1              # One-line PowerShell installer for Windows
├── android-native/          # Native Android app (Jetpack Compose & Media3)
│   └── app/src/main/
│       ├── java/com/nandu/harmonix/
│       │   ├── data/        # Data Layer (MusicSource, Saavn, YouTube, Audius, SyncRepository)
│       │   ├── playback/    # Media3 session service, PlaybackManager, Equalizer, Cast
│       │   ├── widget/      # Responsive Home Widget & Real-Time Live Lyrics Engine
│       │   └── ui/          # Compose UI (home, search, player, lyrics, settings, update)
│       └── res/             # Vector drawables, layouts, localized strings
├── desktop/                 # Native Electron JS desktop application
│   ├── electron/            # Main process (local server, auto-updater, IPC handlers)
│   ├── src/                 # React UI (components, screens, contexts, services)
│   ├── package.json         # Electron & Vite dependencies
│   └── vite.config.js       # Vite configuration
├── backend/                 # Cloud Sync, Session Tracking & Universal Share Server
│   ├── src/
│   │   ├── middleware/      # Rate limiting (progressive lockout), Firebase auth
│   │   ├── routes/          # /me, /me/sessions, /pair, /library, /share, /health
│   │   ├── db.js            # MongoDB Atlas connection pooling & session collections
│   │   └── app.js           # Helmet security, route configuration
│   └── package.json         # Express & Firebase Admin dependencies
└── branding/                # Harmonix official branding, logos & iconography
```

---

## Build from Source

### Android App
Requires **JDK 17** and Android SDK (compileSdk 35).
```bash
cd android-native
./gradlew :app:assembleDebug
```

### Desktop App
Requires **Node.js 20+** and **npm 9+**.
```bash
cd desktop
npm install
npm run build
npm run electron
```

To package the Windows setup installer (`Harmonix-Setup.exe`):
```bash
npm run dist
```

### Backend
```bash
cd backend
npm install
npm run dev
```

---

## License

Proprietary Software — Copyright © 2026 Nandi Vardhan Reddy Kovvuri. All rights reserved. See [LICENSE](LICENSE) for details.

---

<div align="center">

<img src="branding/logos/symbol/harmonix-symbol-white-red.svg" width="48" alt="Harmonix" />

<br/>

Harmonix · Developed by **[Nandi Vardhan](https://github.com/NandiVardhan2007)**

</div>
