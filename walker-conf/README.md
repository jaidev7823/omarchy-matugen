
---

## 🎯 Walker Configuration

This project includes multiple **Walker** launcher configurations for different use cases. Walker is a fast, lightweight application launcher and command runner for Wayland.

### 📦 Included Walker Configs

| Config | Repository | System Path | Purpose |
|--------|-----------|-------------|---------|
| **Default Walker** | `walker/config.toml` | `~/.config/walker/config.toml` | Standard Walker launcher with desktop apps, web search, files, and calculator |
| **Omarchy Default Theme** | `omarchy-default-walker/walker/` | `~/.local/share/omarchy/default/walker/themes/` | System service configuration for Omarchy integration |
| **Walker CSS Theme** | `theme-walker-css/walker.css` | `~/.config/omarchy/current/theme/walker.css` | Stylish CSS theme for Walker UI |

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

#### Theme Files & Deployment

**Default Walker Config**
- Repository: `walker/config.toml`
- Deploys to: `~/.config/walker/config.toml`
- Standard configuration for Walker launcher

**Omarchy Default Style** 
- Repository: `omarchy-default-walker/walker/themes/omarchy-default/style.css`
- Deploys to: `~/.local/share/omarchy/default/walker/themes/`
- Material Design inspired styling
- Smooth transitions and hover effects
- Integrates with matugen color palette

**Walker CSS Theme**
- Repository: `theme-walker-css/walker.css`
- Deploys to: `~/.config/omarchy/current/theme/walker.css`
- Custom dark theme colors
- Enhanced borders and backgrounds
- Professional, minimalist design

### 📖 Additional Resources

- [Walker GitHub Repository](https://github.com/abenz1267/walker)
- [Omarchy Amekoji Theme](https://github.com/atif-1402/omarchy-amekoji-theme)
- [GTK CSS Documentation](https://docs.gtk.org/gtk4/css-overview.html)