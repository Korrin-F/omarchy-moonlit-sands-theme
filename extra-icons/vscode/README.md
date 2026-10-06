# Moonlit Sands file icons for VS Code

This folder is a small VS Code extension. It holds VS Code's own Seti file
icons (the glyph font and the list of which icon goes with which file type)
with every icon colour swapped for a Moonlit Sands palette colour. It works
the same in VSCodium and Cursor.

## How it gets installed

The theme kit's `link-theme-icons` hook (in `~/.config/omarchy/hooks/theme-set.d/`)
runs each time a theme is applied. When the theme ships this folder, the hook
links it into each installed editor's extensions folder as
`omarchy-theme-icons`, registers it there, and sets `"workbench.iconTheme"` to
`omarchy-icons` in that editor's settings. When a theme without it is applied,
the hook removes the link and sets the icons back to VS Code's default Seti.

## Once per machine

VS Code only looks through its extensions folder when it starts. After the
hook installs this for the first time, reload the window (Command Palette,
"Developer: Reload Window") or restart VS Code.

## Rebuilding after a palette change

Start from VS Code's `resources/app/extensions/theme-seti/icons/vs-seti-icon-theme.json`
and replace every `fontColor` with the current value of the palette slot
below from `colors.toml`. Each Seti colour has a dark and a light variant;
both take the same slot. Nothing else in the file changes.

| Seti colour | Palette slot |
|---|---|
| blue | `blue` |
| red | `red` |
| orange | `orange` |
| purple | `magenta` |
| green | `green` |
| yellow | `yellow` |
| white | `bright_foreground` |
| grey | `muted` |
| pink | `bright_magenta` |
| dark grey | `dark_foreground` |
| ignore (git-ignored files) | `muted` |

Write the result to `icons/omarchy-icon-theme.json`. `icons/seti.woff` is a
plain copy of VS Code's and only needs replacing if VS Code updates Seti.
