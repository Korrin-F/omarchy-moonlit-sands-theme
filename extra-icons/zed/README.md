# Moonlit Sands file icons for Zed

This folder is a small Zed extension. It holds the file and folder icons from
Catppuccin Icons for Zed (the Mocha flavour, and the list of which icon goes
with which file type) with every icon colour swapped for a Moonlit Sands
palette colour.

## How it gets installed

The theme kit's `link-theme-icons` hook (in `~/.config/omarchy/hooks/theme-set.d/`)
runs each time a theme is applied. When the theme ships this folder and Zed is
installed, the hook links it into Zed's extensions folder
(`~/.local/share/zed/extensions/installed/`) as `omarchy-icons`. When a theme
without a Zed set is applied, the hook removes the link.

The icon theme appears in Zed's icon theme picker as "Omarchy Icons". Every
Omarchy theme that ships a Zed set uses that same name, so `"icon_theme"` in
`~/.config/zed/settings.json` names it once and never needs to change. The
hook writes that setting only when it is not there yet. After that, Zed does
the rest: whenever an extension is loaded or removed, Zed applies the icon
theme its settings name again, so a theme switch shows the new theme's icons,
and a theme without a set drops Zed back to its default icons.

## Once per machine

After the first theme with a Zed set is applied, restart Zed once (or save
Zed's settings from inside Zed), because Zed does not reliably notice the
hook's first write to its settings file. From then on, every theme switch
applies the right icons on its own.

## Rebuilding after a palette change

Start from the Catppuccin Icons extension for Zed. Copy every SVG in
`icons/mocha/` to `icons/`, and in each one replace every colour with the
current value of the palette slot below from `colors.toml`. Nothing else in
the SVGs changes. Then copy the "Catppuccin Mocha" entry of
`icon_themes/catppuccin-icons.json` into `icon_themes/omarchy-icons.json`,
named "Omarchy Icons", with every `./icons/mocha/` path shortened to
`./icons/`.

| Catppuccin Mocha colour | Palette slot |
|---|---|
| blue `#89b4fa` | `blue` |
| sapphire `#74c7ec` | `bright_blue` |
| lavender `#b4befe` | `magenta` |
| sky `#89dceb` | `bright_cyan` |
| teal `#94e2d5` | `cyan` |
| green `#a6e3a1` | `green` |
| yellow `#f9e2af` | `yellow` |
| peach `#fab387` | `orange` |
| red `#f38ba8` | `bright_red` |
| maroon `#eba0ac` | `red` |
| mauve `#cba6f7` | `magenta` |
| pink `#f5c2e7` | `bright_magenta` |
| flamingo `#f2cdcd` | `bright_red` |
| rosewater `#f5e0dc` | `accent` |
| text `#cdd6f4` | `accent` |
| overlay grey `#7f849c` | `muted` |
| stray yellow `#df8e1d` (in `wally.svg`) | `yellow` |
| stray blue `#3700ff` (in `wally.svg`) | `blue` |

The three `#fff` values (clip paths in `humans.svg` and `wally.svg`, a
gradient stop in `poetry-lock.svg`) stay as they are.
