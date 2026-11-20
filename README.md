<div align="center">

<img src="branding/logos/app-icon/harmonix-app-icon-red.svg" width="140" alt="Harmonix Logo" />

# Harmonix

**Multi-Source HD Music Streaming · Synced Live Lyrics · AI Sing-Along · Offline Downloads**  
*Native Android App · Rust & C++ Accelerated Desktop (Windows & Linux) · Encrypted Cloud Sync & Universal Sharing*

[![Kotlin](https://img.shields.io/badge/Kotlin-2.1-7F52FF?style=flat-square&logo=kotlin&logoColor=white)](https://kotlinlang.org)
[![Rust](https://img.shields.io/badge/Rust-2024_Edition-DEA584?style=flat-square&logo=rust&logoColor=white)](https://www.rust-lang.org)
[![C++](https://img.shields.io/badge/C++-20_Accelerated-00599C?style=flat-square&logo=cplusplus&logoColor=white)](https://isocpp.org)
[![Tauri](https://img.shields.io/badge/Tauri-v2-24C8D8?style=flat-square&logo=tauri&logoColor=white)](https://tauri.app)
[![React](https://img.shields.io/badge/React-18-61DAFB?style=flat-square&logo=react&logoColor=black)](https://react.dev)
[![Jetpack Compose](https://img.shields.io/badge/Jetpack_Compose-Material_3-4285F4?style=flat-square&logo=jetpackcompose&logoColor=white)](https://developer.android.com/jetpack/compose)
[![Platform](https://img.shields.io/badge/Android_%26_Windows_%26_Linux-3DDC84?style=flat-square&logo=linux&logoColor=white)](https://github.com/NandiVardhan2007/Harmonix-Releases)
[![Release](https://img.shields.io/github/v/release/NandiVardhan2007/Harmonix-Releases?style=flat-square&color=FF0033)](https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest)
[![License](https://img.shields.io/badge/License-Proprietary-red?style=flat-square)](LICENSE)

<br/>

[**Download**](#download) · [**Quick Install**](#quick-install) · [**Features**](#features) · [**Desktop Version**](#harmonix-desktop-electron) · [**Tech Stack**](#tech-stack) · [**Build**](#build-from-source) · [**License**](#license)

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
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest/download/Harmonix-Linux.AppImage">
<img src="https://img.shields.io/badge/Linux-Download_AppImage-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux AppImage" height="44"/>
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest/download/Harmonix-Linux.deb">
<img src="https://img.shields.io/badge/Linux-Download_.deb-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Linux Debian/Ubuntu" height="44"/>
</a>

</div>

<br/>

- **Android Mobile**: Native application built with **Jetpack Compose** and **Media3**. Requires **Android 7.0 (API 24)** or newer. Sideload the APK on your device; the built-in SHA-256 verified auto-updater checks the public releases repository and keeps your installation up to date.
- **Windows Desktop**: Native Electron JS desktop application featuring hardware-accelerated Web Audio DSP, frameless glassmorphism design, system media key controls, camera QR code mobile linking, and automated GitHub release update verification (`Harmonix-Setup.exe`).
- **Linux Desktop**: Universal standalone **AppImage** (runs on Ubuntu, Debian, Arch, Fedora, openSUSE, Linux Mint, Pop!_OS, etc.) and native **.deb** package with complete desktop integration, launcher icons, system media key controls, and built-in release updater (`Harmonix-Linux.AppImage` & `Harmonix-Linux.deb`).

---

## Quick Install

### Linux (One-Line Terminal Install)

Install or update Harmonix on any Linux distribution with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.sh | bash
```

The script fetches the latest release from `NandiVardhan2007/Harmonix-Releases`, installs the AppImage into `~/.local/bin/harmonix`, creates desktop launcher entries and high-resolution icons, and integrates with your application menu. To install the native Debian `.deb` package instead, run:
```bash
curl -fsSL https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.sh | bash -s -- --deb
```

### Windows (One-Line Install)

**In Windows PowerShell:**
```powershell
irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.ps1 | iex
```

**In Windows Command Prompt (CMD):**
```cmd
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.ps1 | iex"
```

The script queries the latest public release from `NandiVardhan2007/Harmonix-Releases`, downloads `Harmonix-Setup.exe` with resume/integrity checks, and initiates the setup wizard.

---

## Features

### Liquid Glass & Obsidian Design System

| Feature | Description |
|:---|:---|
| **G2 Continuous Squircles** | Curvature-continuous squircle geometry ($k = 1.528665f$) eliminating harsh tangent breaks across cards, sheets, and artwork |
| **Liquid Glass Physics** | API 31+ frosted background blur, dynamic interactive specular sheen (`BlendMode.Plus`), and spring-damped tactile motion |
| **6-Tier Obsidian Hierarchy** | True deep Obsidian surfaces (`#0C0C0E` base up to `#232328`) paired with a dedicated 0-nit Pure AMOLED black mode |
| **SchemeNeutral Palette** | Color-clamped dynamic tonal palettes ($8.0\text{–}16.0$ chroma) preventing oversaturated clash on vivid album art |
| **600ms Crossfades** | Seamless animated crossfades across dynamic color shifts and background transitions |

---

### Audiophile C++20 Audio Pipeline (`libharmonix_audio.so`)

| Feature | Description |
|:---|:---|
| **15-Band Parametric EQ** | Transposed Direct Form II biquad IIR filters with atomic lock-free coefficient syncing, zero phase distortion, and TPDF dither |
| **Tri-Band AutoMix Crossover** | 4th-order (24 dB/octave) Linkwitz-Riley crossover ($120\text{ Hz}$ & $3800\text{ Hz}$) with sub-bass swapping and smooth soft clipping |
| **100Hz Real-Time Music Haptics** | Real-time PCM transient detector isolating kicks and bass drops for synchronized device haptic vibrations |
| **Multi-Source Streaming** | Aggregates JioSaavn (320kbps lossless with DES-ECB decryption), Audius, and YouTube Music |
| **0ms Gapless Prefetching** | High-performance audio engine pre-resolving and caching the next song ahead of time |
| **Bluetooth Audio Routing** | Instant hardware detection for Bluetooth A2DP headsets, SCO, and system audio outputs |
| **Offline Downloads** | Download tracks up to 320kbps with embedded cover artwork, metadata tags, and LRC lyrics |
| **Smart Infinite Queue** | Taste-aware autoplay algorithm recommending similar tracks when your queue finishes |

---

### Lyrics, Visual Media & AGSL Shaders

- **Word-by-Word TTML Karaoke Canvas**: Microsecond-accurate syllable-by-syllable lyric reveal with smooth vertical syllable lift, soft glow, and `DST_IN` feathered gradient reveal mask.
- **GPU AGSL Fluid Mesh Shader**: Android 13+ (API 33) hardware-accelerated dual-axis quadratic twist distortion and orbital canvas for fluid ambient artwork backgrounds.
- **Headless Video Canvas**: Hardware TextureView player rendering seamlessly looping video canvases without UI overhead.
- **Multilingual Phonetic Sing-Along**: Transliterates songs in 20 languages into authentic native script characters (Telugu `తెలుగు`, Hindi `हिन्दी`, Tamil `தமிழ்`, Kannada `ಕನ್ನಡ`, Malayalam `മലയാളം`, etc.) as well as English Latin romanization.
- **Auto-Adjusting Home Widget**: Responsive launcher widget featuring the signature **"Long Wing"** mode with real-time synchronized live lyrics and 1-tap jump to full-screen lyrics.

---

### Harmonix Jam (Listen Together)

- **Real-Time WebSocket Rooms**: Listen synchronously with friends anywhere in the world over high-speed WebSocket channels (`wss://jam.clashgram.org/ws`).
- **Synchronized Playback**: Sub-millisecond drift compensation with instant host-to-guest play, pause, seek, and track change replication.
- **Collaborative Queues**: Shared room queue allowing participants to add, reorder, and vote on upcoming songs in collaborative mode.
- **In-Room Live Chat & QR Sharing**: Integrated real-time room chat with participant role badges (Host, Co-Host, Listener) and instant QR code sharing.

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

The Harmonix desktop edition provides a full-featured desktop experience matching the mobile version:

- **Local HTTP Origin (`http://localhost:42800`)**: Eliminates `file:///` restrictions, enabling standard Google OAuth popups and Firebase Authentication.
- **Horizontal Shelf Smooth Scrolling**: Converts vertical mouse wheel deltas (`deltaY`) to smooth horizontal scroll (`scrollLeft`) with floating chevron navigation controls.
- **Live Discover Experience**: Automatically populates real-time 320kbps trending superhits, popular movie soundtracks, genre chips, and in-page multi-engine search.
- **Windows System Integrations**: Frameless sleek window controls, persistent bottom player, taskbar thumbnail controls, and native audio downloads.

---

## Tech Stack

```
Mobile (Android)
  Language         Kotlin 2.1 · C++20 (Android NDK r26b)
  UI Engine        Jetpack Compose · Material 3 · Liquid Glass · AGSL Shaders
  Audio Engine     Media3 (ExoPlayer) + libharmonix_audio.so (Biquad EQ & Tri-Band AutoMix)
  Haptics          100Hz Biquad Real-Time Music Haptics
  Scanner          Google Play Services Code Scanner (Auto-capture ML Kit)
  State & DI       ViewModel + StateFlow · Hilt
  Storage          DataStore Preferences · Room · SharedPreferences
  Listen Together  WebSocket Jam Protocol (Real-Time Playback & Collaborative Queue)

Desktop (Windows & Linux)
  Architecture     Tauri v2 + Rust 2024 Edition (with Electron backwards compatibility)
  Native Accel     C++20 SIMD & Bitwise Acceleration (FIPS DES-ECB, Digital Biquad EQ, std::filesystem scanner)
  Frontend         React 18 · Vite · Tailwind CSS
  Audio Engine     Web Audio API (10-Band Parametric EQ & -14 LUFS Limiter)
  SMTC / Island    Windows SMTC MediaSession & Top Dynamic Island Synced Lyrics Engine

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
│       ├── cpp/             # C++20 DSP Engine (15-band EQ, Tri-band Linkwitz-Riley AutoMix)
│       ├── java/com/nandu/harmonix/
│       │   ├── data/        # Data Layer (MusicSource, Jam, Saavn, YouTube, Audius, SyncRepository)
│       │   ├── playback/    # Media3 session service, NativeAudio JNI, MusicHaptics, JamSync
│       │   ├── widget/      # Responsive Home Widget & Real-Time Live Lyrics Engine
│       │   └── ui/          # Compose UI (Liquid Glass theme, Jam, ModernLyrics, FluidShader)
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

To package the Linux standalone AppImage and Debian package:
```bash
npm run dist:linux
```
Outputs are generated in `desktop/release/`:
- `Harmonix-Linux.AppImage` (Universal portable binary)
- `Harmonix-Linux.deb` (Native Debian/Ubuntu package)

To package the Windows setup installer (`Harmonix-Setup.exe`):
```bash
npm run dist:win
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
