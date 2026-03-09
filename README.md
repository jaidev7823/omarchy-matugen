# Omarchy + Matugen

**Omarchy** is hardcoded to use `swaybg`, which is a static wallpaper setter. This project intercepts Omarchy's calls to `swaybg` and redirects them to a modern pipeline using **swww** (for transitions) and **matugen** (for Material You color generation).

## 📺 Demo

Watch the smooth transitions and real-time color shifting in action:

[![Watch the Demo](https://img.youtube.com/vi/czyx66GCLYA/maxresdefault.jpg)](https://www.youtube.com/watch?v=czyx66GCLYA)

## 🚀 How it Works

This setup uses a "Binary Shim" strategy. By placing a custom script named `swaybg` in `~/.local/bin`, we trick Omarchy into running our logic instead of the real `swaybg` binary.

The flow:
1. Omarchy calls `swaybg` (our shim script)
2. Our shim redirects to `omarchy-sync`
3. `omarchy-sync` resolves the symlink and triggers `swww` + `matugen`
4. Wallpaper changes with smooth transitions and color updates

## 🛠️ Installation

### Prerequisites

Ensure you have the following installed:

- **swww**: For smooth wallpaper transitions
- **matugen**: For real-time color palette generation
- **inotify-tools**: To watch for Omarchy symlink changes

### Step 1: Remove Original swaybg

To ensure Omarchy uses our custom script, remove or move the original `swaybg` binary:

```bash
sudo pacman -Rs swaybg
```

### Step 2: Deploy Scripts

Move the scripts into your local bin and make them executable:

```bash
cp bin/* ~/.local/bin/
cd ~/.local/bin/
chmod +x chwall swaybg omarchy-sync
```

### Step 3: Configuration

Place the matugen folder into your .config directory:

```bash
cp -r matugen ~/.config/
```

## 📂 File Breakdown

| File | Purpose |
|------|---------|
| `swaybg` | The Decoy. Intercepts Omarchy's call and redirects to `omarchy-sync`. |
| `omarchy-sync` | The Engine. Resolves the symlink and triggers swww + matugen. |
| `chwall` | Manual Override. Change wallpapers directly from the terminal. |

## 🎨 Terminal Integration

To see the colors change live in Kitty, add this line to your `~/.config/kitty/kitty.conf`:

```ini
include matugen.conf
```
## ⚙️ Matugen Configuration

Matugen can execute commands (hooks) after generating colors. If your configuration includes hooks for services you don't have installed (like `cava` or `waybar`), it might throw errors.

Ensure you check your `~/.config/matugen/config.toml` and comment out or remove any `post_hook` lines for applications you are not currently using:

```toml
# Example: Comment out hooks for services you don't use
# post_hook = "pkill -USR1 cava" 
# post_hook = "waybar-signal 1"
```

## 🔧 Automation

```bash
nvim ~/.config/hypr/autostart.conf
```
Add these lines to your `autostart.conf` to start the daemon and the sync-watcher on login:

```bash
exec-once = swww-daemon
exec-once = while inotifywait -e create,modify,attrib ~/.config/omarchy/current/background; do omarchy-sync; done &
```

---

## 🎯 Walker Configuration

This project includes multiple **Walker** launcher configurations for different use cases. Walker is a fast, lightweight application launcher and command runner for Wayland.

### 📦 Included Walker Configs

| Config | Location | Purpose |
|--------|----------|---------|
| **Default Walker** | `walker/config.toml` | Standard Walker launcher with desktop apps, web search, files, and calculator |
| **Omarchy Default Theme** | `omarchy-default-walker/walker/` | System service configuration for Omarchy integration |
| **Amekoji Theme** | `theme-walker-css/walker.css` | Stylish Amekoji-themed CSS for Walker UI |

### ⚙️ Setup

#### Use Amekoji Theme (recommended if using omarchy)

- 📦 Install -
   - Paste the command in your terminal ⬇️
     
  ```bash
   omarchy-theme-install https://github.com/atif-1402/omarchy-amekoji-theme.git
   ```
  
  OR
  
  - Open Omarchy Menu (Super + Alt + Space)
  - Go to Install > Style > Theme and paste the the below git repo link ⬇️
    
   ```bash
   https://github.com/atif-1402/omarchy-amekoji-theme.git
   ```

#### Theme Files

**Omarchy Default Style** (`omarchy-default-walker/walker/themes/omarchy-default/style.css`)
- Material Design inspired styling
- Smooth transitions and hover effects
- Integrates with matugen color palette

**Amekoji Theme** (`theme-walker-css/walker.css`)
- Custom dark theme colors
- Enhanced borders and backgrounds
- Professional, minimalist design

### 📖 Additional Resources

- [Walker GitHub Repository](https://github.com/abenz1267/walker)
- [Omarchy Amekoji Theme](https://github.com/atif-1402/omarchy-amekoji-theme)
- [GTK CSS Documentation](https://docs.gtk.org/gtk4/css-overview.html)