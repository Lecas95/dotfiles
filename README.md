# 🛠️ My Dotfiles

These are my personal configuration files for my Arch Linux + Hyprland setup.

## 📦 Package Lists
- `pkglist.txt`: All installed packages via pacman.
- `aurlist.txt`: AUR packages installed via yay.

## 🗂️ Structure
This repo uses [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks.
Each application/config has its own folder with the necessary structure for stow.

```
~/dotfiles/
├── alacritty/
│   └── .config/alacritty/
├── hypr/
│   └── .config/hypr/
├── nvim/
│   └── .config/nvim/
...
```

## 🚀 Bootstrap on a New System
```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow */
sudo pacman -S --needed - < pkglist.txt
yay -S --needed - < aurlist.txt
```

## 💡 Notes
- Some files (like `gtkrc-2.0`, `mimeapps.list`) are moved into `.config/` if needed.
- Make sure you have `stow` installed: `sudo pacman -S stow`