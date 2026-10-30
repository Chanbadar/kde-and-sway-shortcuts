# Arch Linux + Sway Dotfiles

Minimalist, dark-themed, and productivity-focused Arch Linux desktop configuration running on Sway (Wayland).

---

## System Components

- **Window Manager:** Sway (Wayland) + `autotiling`
- **Bar:** Waybar
- **Notification Daemon:** Mako (with Do Not Disturb mode and 2s popup timer)
- **Application Launcher:** Rofi (App launcher, Emoji picker, Window switcher)
- **Clipboard Manager:** `cliphist` + `wl-clipboard`
- **Lock Screen:** Swaylock (custom wallpaper integration)
- **Terminal:** Alacritty
- **Browser:** LibreWolf (Dark Mode & Native GTK Portal Enabled)
- **File Manager:** Thunar
- **Image & PDF Viewers:** `imv` (Images), `zathura` (PDFs)
- **Screen Capture:** `grim` + `slurp` + `swappy` (Screenshots), `wf-recorder` (Screen Recording)

---

## Keybindings Reference

| Shortcut | Action |
| :--- | :--- |
| `Meta + Return` / `Meta + R` | Launch Alacritty Terminal |
| `Alt + Space` / `Alt + F2` | Open Rofi App Launcher |
| `Meta + F` | Launch LibreWolf Browser |
| `Meta + E` | Open Thunar File Manager |
| `Meta + Z` | Launch ZapZap (WhatsApp Client) |
| `Meta + Shift + V` | Open Clipboard History (`cliphist`) |
| `Meta + .` | Open Rofi Emoji Picker |
| `Meta + Shift + N` | Toggle Do Not Disturb Mode |
| `Meta + L` | Lock Screen (`swaylock`) |
| `Meta + Shift + E` | Power Menu (`wlogout`) |
| `Print` / `Meta + Shift + S` | Region Screenshot & Edit (`swappy`) |
| `Shift + Print` | Region Screenshot to Clipboard |
| `Ctrl + Print` | Fullscreen Screenshot to `~/Pictures` |
| `Meta + Shift + R` | Start/Stop Screen Recording |

---

## Installation

Run the automated installation script on a fresh Arch Linux setup:

```bash
git clone [https://github.com/Chanbadar/my-dotfiles.git](https://github.com/Chanbadar/my-dotfiles.git)
cd my-dotfiles
chmod +x install.sh
./install.sh
