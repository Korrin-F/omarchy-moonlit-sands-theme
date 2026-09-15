# <Theme Name>

An [Omarchy](https://omarchy.org) theme. <One-paragraph description: mood, medium,
time of day, what makes the palette distinct>. <Optional: mention of a companion
theme, or delete this sentence.>

![<Theme Name> on the desktop: <what the hero shot shows>](screenshots/desktop.webp)

## Install

```
omarchy theme install https://github.com/<user>/omarchy-<name>-theme
```

Or in Omarchy: Super+Space, then Install > Style > Theme and paste the URL above.

It installs as `<name>`.

> [!NOTE]
> Not all theme elements are installed fully by this method, if you are interested in a fuller theme, including <custom folder icons / other extras>, then see the full list of instructions below to install the rest.

<!-- Delete the callout above if this theme ships no optional extras. -->

## Wallpapers

<How many> scenes depicting <subject>. Painted in <medium>. <One line on mood
and legibility over the bar>. Each wallpaper was hand-tuned so the colours and
lighting are cohesive across the set.

<p>
  <img src="screenshots/wallpaper-1-<name>.webp" width="32%" alt="<description>">
  <img src="screenshots/wallpaper-2-<name>.webp" width="32%" alt="<description>">
  <img src="screenshots/wallpaper-3-<name>.webp" width="32%" alt="<description>">
</p>
<p>
  <img src="screenshots/wallpaper-4-<name>.webp" width="32%" alt="<description>">
  <img src="screenshots/wallpaper-5-<name>.webp" width="32%" alt="<description>">
  <img src="screenshots/wallpaper-6-<name>.webp" width="32%" alt="<description>">
</p>

<!-- Adjust the row size and count to match how many wallpapers the set actually has. -->

## Theme Details

<A short paragraph on the palette: what plays the "page" role, what plays the
"panel" role, what the accent and selection colours are, what the terminal
palette leans on.>

<p>
  <img src="screenshots/terminal-palette.webp" width="48%" alt="The terminal palette">
  <img src="screenshots/<second-detail-shot>.webp" width="48%" alt="<description>">
</p>

Left: <caption>.
Right: <caption>.

<p>
  <img src="screenshots/menu.webp" width="32%" alt="The Omarchy menu">
  <img src="screenshots/boot-screen.webp" width="64%" alt="The boot screen">
</p>

Left: the Omarchy menu.
Right: the boot and disk-unlock screen.

## What is Themed?

Everything Omarchy themes as standard, plus hand-tuned files for <list the
apps this theme ships shipped colour-only files for: the Omarchy shell, btop,
Helix, Obsidian, VS Code, Chromium and Brave, Claude Code and Pi, and so on>,
so those apps get the theme's own look instead of a generic conversion.

As with any Omarchy theme, a few apps need one step to activate the theme for
the first time:

- Obsidian: Settings > Appearance > Themes > Manage, choose "Omarchy".
- Claude Code: run `omarchy-theme-set-claude --activate` once.
- Pi: run `omarchy-theme-set-pi --activate` once.
- Chromium or Brave: restart the browser.

<!-- Keep only the activation lines that apply to this theme's shipped files. -->

## Optional extras

Omarchy themes an app by filling a template with the palette on every theme
change, and it lets you add your own templates for apps it has not covered
yet. <If this theme ships extra-templates/ and/or extra-icons/, describe them
here in one or two sentences; otherwise delete this section entirely.>
Omarchy does not read those folders on its own, so each extra takes a single
paste: copy the template into Omarchy's user-templates folder, then link the
file it produces to where the app looks (instructions are below).

### Files and other GTK apps

Gives Files (Nautilus) and other GTK4 apps the theme's palette instead of
GTK's default look. Paste this once:

```
mkdir -p ~/.config/omarchy/themed ~/.config/gtk-4.0
cp ~/.config/omarchy/themes/<name>/extra-templates/gtk.css.tpl ~/.config/omarchy/themed/
ln -sfn ~/.local/state/omarchy/current/theme/gtk.css ~/.config/gtk-4.0/gtk.css
omarchy theme refresh
```

Reopen Files to see it. The template follows whichever theme is active, so it
keeps working if you switch themes. If you already had a
`~/.config/gtk-4.0/gtk.css` of your own, this replaces it.

To undo: `rm ~/.config/omarchy/themed/gtk.css.tpl ~/.config/gtk-4.0/gtk.css`

### Zed

Gives Zed the same palette as the other editors. Paste this once, then pick
"Omarchy" in Zed's theme picker (Ctrl+K then Ctrl+T):

```
cp ~/.config/omarchy/themes/<name>/extra-templates/zed.json.tpl ~/.config/omarchy/themed/
mkdir -p ~/.config/zed/themes
ln -sfn ~/.local/state/omarchy/current/theme/zed.json ~/.config/zed/themes/omarchy.json
omarchy theme refresh
```

Zed reloads it live and follows every theme change from then on. If Omarchy
installed Zed for you, it also installed omazed, which keeps offering its own
"Omazed" theme in the picker; the two do not interfere.

To undo: `rm ~/.config/omarchy/themed/zed.json.tpl ~/.config/zed/themes/omarchy.json`
and pick another theme in Zed.

### <Icon set name> folder icons

<One line describing the icon set's design.> The theme installs with
<fallback Yaru variant>, which Omarchy already ships. This hook links the
custom set into place and selects it after every theme change. Paste this
once:

```
mkdir -p ~/.config/omarchy/hooks/theme-set.d
cat > ~/.config/omarchy/hooks/theme-set.d/link-theme-icons <<'EOF'
#!/bin/bash
# Omarchy runs every script in this folder after a theme is applied or refreshed,
# passing the theme's name as $1. This one asks: does the theme that was just
# applied ship an icon set? Omarchy copies a theme's extra-icons/ folder into
# the live theme directory untouched, so the answer is on disk. If a set is
# there, link it where GTK looks and select it. Themes without one are left
# exactly as Omarchy set them from their icons.theme.
#
# An icon set is any folder holding an index.theme; its folder name must match
# the Name= line inside (the normal convention).
set -euo pipefail
theme_dir=$HOME/.local/state/omarchy/current/theme
icons_dir=$HOME/.local/share/icons
mkdir -p "$icons_dir"

# Drop links we made for a previous theme that no longer resolve.
for link in "$icons_dir"/*; do
  [[ -L $link && ! -e $link ]] && rm -f "$link"
done

shopt -s nullglob
for index in "$theme_dir"/extra-icons/*/index.theme; do
  set_dir=$(dirname "$index")
  name=$(basename "$set_dir")
  ln -sfn "$set_dir" "$icons_dir/$name"
  gsettings set org.gnome.desktop.interface icon-theme "$name"
  exit 0
done
EOF
omarchy theme refresh
```

The hook is generic: any theme that ships an `extra-icons/<Name>/index.theme`
folder gets its icons selected, and themes without one are left as Omarchy
set them.

To undo: `rm ~/.config/omarchy/hooks/theme-set.d/link-theme-icons ~/.local/share/icons/<Icon-Set-Name>`
then `omarchy theme refresh`

<!-- Delete whichever of the three extras blocks above this theme doesn't ship. -->

## Credits and licence

The configuration files and templates are by <author> under the MIT licence
(see `LICENSE`). The artwork is by <author> under Creative Commons
Attribution-NonCommercial 4.0 (see `LICENSE-ARTWORK`): <list what's covered —
wallpapers, icon set, boot-screen logo, screenshots>. Credit <author> when you
use it; commercial use needs permission. <If the boot logo is built on the
Omarchy wordmark, keep this line: The boot-screen logo is built on the
Omarchy wordmark, copyright David Heinemeier Hansson, MIT licence.>
