#!/usr/bin/env bash
# ==============================================================================
# Harmonix Music - Universal One-Line Installer Script
# One-line execution (Linux / Unix / Git Bash):
#   curl -fsSL https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.sh | bash
# Or with options:
#   curl -fsSL https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.sh | bash -s -- --deb
# ==============================================================================

set -euo pipefail

# ANSI color codes
CYAN='\033[0;36m'
DARK_CYAN='\033[0;34m'
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

echo -e ""
echo -e "${CYAN}  ================================================================${NC}"
echo -e "${WHITE}                          HARMONIX MUSIC                          ${NC}"
echo -e "${DARK_CYAN}        HD Music Streaming * Synced Lyrics * Cross-Device Sync     ${NC}"
echo -e "${CYAN}  ================================================================${NC}"
echo -e ""

OS_RAW="$(uname -s)"
IS_WINDOWS=false
IS_LINUX=false
IS_MAC=false

case "$OS_RAW" in
    Linux*)
        IS_LINUX=true
        ;;
    Darwin*)
        IS_MAC=true
        ;;
    CYGWIN*|MINGW*|MSYS*)
        IS_WINDOWS=true
        ;;
    *)
        echo -e "${YELLOW}Warning: Unrecognized operating system: $OS_RAW${NC}"
        ;;
esac

# Check download tool (curl or wget)
DOWNLOADER=""
if command -v curl >/dev/null 2>&1; then
    DOWNLOADER="curl"
elif command -v wget >/dev/null 2>&1; then
    DOWNLOADER="wget"
else
    echo -e "${RED}Error: Neither curl nor wget was found. Please install curl or wget first.${NC}" >&2
    exit 1
fi

download_file() {
    local url="$1"
    local output="$2"
    if [ "$DOWNLOADER" = "curl" ]; then
        curl -fL --retry 3 --retry-delay 2 --progress-bar -o "$output" "$url"
    else
        wget --tries=3 --waitretry=2 --show-progress -O "$output" "$url"
    fi
}

fetch_json() {
    local url="$1"
    if [ "$DOWNLOADER" = "curl" ]; then
        curl -fsSL -H "User-Agent: Harmonix-Installer" -H "Accept: application/vnd.github.v3+json" "$url" 2>/dev/null || true
    else
        wget -qO- --header="User-Agent: Harmonix-Installer" --header="Accept: application/vnd.github.v3+json" "$url" 2>/dev/null || true
    fi
}

# ------------------------------------------------------------------------------
# 1. WINDOWS (Git Bash / Cygwin / MSYS)
# ------------------------------------------------------------------------------
if [ "$IS_WINDOWS" = true ]; then
    echo -e "  ${YELLOW}[1/3] Windows environment detected ($OS_RAW)...${NC}"
    RepoPrimary="NandiVardhan2007/Harmonix-Releases"
    RepoFallback="NandiVardhan2007/Harmonix"
    
    DL_URL="https://github.com/$RepoPrimary/releases/latest/download/Harmonix-Setup.exe"
    TMP_EXE="${TEMP:-/tmp}/Harmonix-Setup.exe"

    echo -e "  ${YELLOW}[2/3] Downloading Harmonix Windows Setup...${NC}"
    rm -f "$TMP_EXE"
    download_file "$DL_URL" "$TMP_EXE" || {
        echo -e "        ${GRAY}Primary source failed, trying secondary mirror...${NC}"
        download_file "https://github.com/$RepoFallback/releases/latest/download/Harmonix-Setup.exe" "$TMP_EXE"
    }

    echo -e "  ${YELLOW}[3/3] Launching Harmonix Setup...${NC}"
    cmd.exe /c start "" "$(cygpath -w "$TMP_EXE" 2>/dev/null || echo "$TMP_EXE")" || {
        powershell.exe -Command "Start-Process '$TMP_EXE'"
    }

    echo -e ""
    echo -e "${CYAN}  ================================================================${NC}"
    echo -e "${GREEN}  Harmonix installer has launched! Follow the on-screen wizard.   ${NC}"
    echo -e "${CYAN}  ================================================================${NC}"
    echo -e ""
    exit 0
fi

# ------------------------------------------------------------------------------
# 2. MACOS
# ------------------------------------------------------------------------------
if [ "$IS_MAC" = true ]; then
    echo -e "${YELLOW}Notice: Harmonix native desktop is currently released for Linux and Windows.${NC}"
    echo -e "${WHITE}For mobile devices, download the Android APK from:${NC}"
    echo -e "  ${CYAN}https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest${NC}"
    exit 0
fi

# ------------------------------------------------------------------------------
# 3. LINUX
# ------------------------------------------------------------------------------
ARCH="$(uname -m)"
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "amd64" ]; then
    echo -e "${YELLOW}Warning: Currently pre-built binaries are optimized for x86_64 architecture. Detected: $ARCH${NC}"
fi

# Parse options
INSTALL_DEB=false
AUTO_RUN=true

for arg in "$@"; do
    case "$arg" in
        --deb)
            INSTALL_DEB=true
            ;;
        --appimage)
            INSTALL_DEB=false
            ;;
        --no-run)
            AUTO_RUN=false
            ;;
        --help|-h)
            echo "Usage: install.sh [OPTIONS]"
            echo "Options:"
            echo "  --appimage    Install standalone AppImage to ~/.local/bin (Default)"
            echo "  --deb         Install native Debian/Ubuntu .deb package (requires sudo)"
            echo "  --no-run      Do not launch Harmonix after installation"
            echo "  -h, --help    Show this help message"
            exit 0
            ;;
    esac
done

# If Debian/Ubuntu and user is root without flag, default to deb
if [ "$INSTALL_DEB" = false ] && [ -f /etc/debian_version ] && command -v dpkg >/dev/null 2>&1; then
    if [ "${EUID:-$(id -u)}" -eq 0 ]; then
        INSTALL_DEB=true
    fi
fi

# 1. Fetch Latest Release Information
RepoPrimary="NandiVardhan2007/Harmonix-Releases"
RepoFallback="NandiVardhan2007/Harmonix"
ApiUrl="https://api.github.com/repos/$RepoPrimary/releases/latest"

echo -e "  ${YELLOW}[1/4] Checking latest release from $RepoPrimary...${NC}"

TARGET_EXT="AppImage"
if [ "$INSTALL_DEB" = true ]; then
    TARGET_EXT="deb"
fi

DOWNLOAD_URL=""
TAG_NAME="latest"

RELEASE_JSON="$(fetch_json "$ApiUrl")"
if [ -z "$RELEASE_JSON" ] || echo "$RELEASE_JSON" | grep -q '"message":'; then
    FallbackUrl="https://api.github.com/repos/$RepoFallback/releases/latest"
    RELEASE_JSON="$(fetch_json "$FallbackUrl")"
fi

if [ -n "$RELEASE_JSON" ] && ! echo "$RELEASE_JSON" | grep -q '"message":'; then
    TAG_NAME="$(echo "$RELEASE_JSON" | grep -o '"tag_name": *"[^"]*"' | head -n 1 | cut -d '"' -f 4 || echo "latest")"
    DOWNLOAD_URL="$(echo "$RELEASE_JSON" | grep -o "https://[^\"]*Harmonix[^\"]*\\.$TARGET_EXT" | head -n 1 || true)"
    if [ -z "$DOWNLOAD_URL" ]; then
        DOWNLOAD_URL="$(echo "$RELEASE_JSON" | grep -o "https://[^\"]*\\.$TARGET_EXT" | head -n 1 || true)"
    fi
fi

# Fallback resilient direct download URL (immune to GitHub API rate limiting)
if [ -z "$DOWNLOAD_URL" ]; then
    DOWNLOAD_URL="https://github.com/$RepoPrimary/releases/latest/download/Harmonix-Linux.$TARGET_EXT"
fi

echo -e "        ${GREEN}Target release: $TAG_NAME (Format: $TARGET_EXT)${NC}"

FILE_NAME="Harmonix-Linux.$TARGET_EXT"
TEMP_DIR="${TMPDIR:-/tmp}"
TARGET_TMP="$TEMP_DIR/$FILE_NAME"

# 2. Download Release Binary
echo -e "  ${YELLOW}[2/4] Downloading $FILE_NAME...${NC}"
rm -f "$TARGET_TMP"

download_file "$DOWNLOAD_URL" "$TARGET_TMP" || {
    FALLBACK_DL="https://github.com/$RepoFallback/releases/latest/download/Harmonix-Linux.$TARGET_EXT"
    echo -e "        ${GRAY}Primary source failed, trying secondary mirror...${NC}"
    download_file "$FALLBACK_DL" "$TARGET_TMP"
}

if [ ! -f "$TARGET_TMP" ] || [ ! -s "$TARGET_TMP" ]; then
    echo -e "${RED}Error: Downloaded file is missing or empty. Please check your internet connection.${NC}" >&2
    exit 1
fi

FILE_SIZE_MB="$(du -m "$TARGET_TMP" | cut -f1)"
echo -e "        ${GREEN}Download completed successfully (${FILE_SIZE_MB} MB).${NC}"

# 3. Install & Integrate with Linux Desktop
echo -e "  ${YELLOW}[3/4] Installing and integrating Harmonix...${NC}"

if [ "$INSTALL_DEB" = true ]; then
    echo -e "        Installing Debian package..."
    if command -v apt-get >/dev/null 2>&1; then
        if [ "${EUID:-$(id -u)}" -eq 0 ]; then
            apt-get update -qq && apt-get install -y "$TARGET_TMP"
        else
            sudo apt-get update -qq && sudo apt-get install -y "$TARGET_TMP"
        fi
    else
        if [ "${EUID:-$(id -u)}" -eq 0 ]; then
            dpkg -i "$TARGET_TMP" || apt-get install -f -y
        else
            sudo dpkg -i "$TARGET_TMP" || sudo apt-get install -f -y
        fi
    fi
    rm -f "$TARGET_TMP"
    echo -e "        ${GREEN}Package installed successfully!${NC}"
else
    INSTALL_DIR="$HOME/.local/bin"
    APPS_DIR="$HOME/.local/share/applications"
    ICONS_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"

    mkdir -p "$INSTALL_DIR" "$APPS_DIR" "$ICONS_DIR"

    FINAL_APPIMAGE="$INSTALL_DIR/harmonix"
    cp "$TARGET_TMP" "$FINAL_APPIMAGE"
    chmod +x "$FINAL_APPIMAGE"
    rm -f "$TARGET_TMP"

    # Extract or download icon
    ICON_PATH="$ICONS_DIR/harmonix.png"
    ICON_URL="https://raw.githubusercontent.com/$RepoPrimary/main/desktop/assets/icon.png"
    if [ "$DOWNLOADER" = "curl" ]; then
        curl -fsSL -o "$ICON_PATH" "$ICON_URL" 2>/dev/null || true
    else
        wget -qO "$ICON_PATH" "$ICON_URL" 2>/dev/null || true
    fi

    # Create Freedesktop .desktop entry
    DESKTOP_FILE="$APPS_DIR/harmonix.desktop"
    cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Harmonix
Comment=Multi-Source HD Music Streaming · Synced Live Lyrics · AI Sing-Along
GenericName=Music Player
Exec=$FINAL_APPIMAGE %U
Icon=harmonix
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Player;Music;
Keywords=music;streaming;lyrics;player;audio;harmonix;
MimeType=x-scheme-handler/harmonix;
StartupWMClass=harmonix
EOF
    chmod +x "$DESKTOP_FILE"

    if command -v update-desktop-database >/dev/null 2>&1; then
        update-desktop-database "$APPS_DIR" 2>/dev/null || true
    fi

    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo -e "        ${GRAY}Note: ~/.local/bin is not in your current PATH. You can add it to ~/.bashrc or ~/.zshrc:${NC}"
        echo -e "        ${GRAY}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
    fi

    echo -e "        ${GREEN}Harmonix installed to $FINAL_APPIMAGE${NC}"
    echo -e "        ${GREEN}Desktop launcher integrated at $DESKTOP_FILE${NC}"
fi

# 4. Launch Application
echo -e "  ${YELLOW}[4/4] Finalizing setup...${NC}"

if [ "$AUTO_RUN" = true ] && [ -n "${DISPLAY:-${WAYLAND_DISPLAY:-}}" ]; then
    echo -e "  Launching Harmonix..."
    if [ "$INSTALL_DEB" = true ]; then
        (harmonix >/dev/null 2>&1 &) || true
    else
        ("$HOME/.local/bin/harmonix" >/dev/null 2>&1 &) || true
    fi
fi

echo -e ""
echo -e "${CYAN}  ================================================================${NC}"
echo -e "${GREEN}  Harmonix has been successfully installed on your Linux system!   ${NC}"
echo -e "${WHITE}  Launch it from your Applications menu or run 'harmonix' in terminal.${NC}"
echo -e "${CYAN}  ================================================================${NC}"
echo -e ""
