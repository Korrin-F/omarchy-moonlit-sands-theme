/* GTK3 colours for Omarchy themes (the portal file chooser, Evince, Inkscape, GNOME Disks and other GTK3 apps).
   Omarchy renders this template into ~/.local/state/omarchy/current/theme/gtk3.css
   on every theme change; ~/.config/gtk-3.0/gtk.css is a symlink to that copy.
   GTK3 reads it at app start — reopen an app (and restart xdg-desktop-portal-gtk) to see a change. */

/* Window and content surfaces: background. */
@define-color theme_bg_color {{ background }};
@define-color bg_color {{ background }};
@define-color theme_unfocused_bg_color {{ background }};
@define-color insensitive_bg_color {{ background }};
@define-color theme_base_color {{ background }};
@define-color theme_unfocused_base_color {{ background }};
@define-color insensitive_base_color {{ background }};
@define-color content_view_bg {{ background }};
@define-color text_view_bg {{ background }};

/* Text: foreground; disabled text: muted. */
@define-color theme_fg_color {{ foreground }};
@define-color theme_text_color {{ foreground }};
@define-color text_color {{ foreground }};
@define-color theme_unfocused_fg_color {{ foreground }};
@define-color theme_unfocused_text_color {{ foreground }};
@define-color insensitive_fg_color {{ muted }};
@define-color unfocused_insensitive_color {{ muted }};

/* Selection: accent, background text. GTK3 also uses it as its accent (suggested buttons, switches on, links, progress). */
@define-color theme_selected_bg_color {{ accent }};
@define-color selected_bg_color {{ accent }};
@define-color theme_unfocused_selected_bg_color {{ accent }};
@define-color theme_selected_fg_color {{ background }};
@define-color selected_fg_color {{ background }};
@define-color theme_unfocused_selected_fg_color {{ background }};

/* Borders: darker_background. */
@define-color borders {{ darker_background }};
@define-color unfocused_borders {{ darker_background }};

/* Status colours and info bars: yellow, red, green, blue, magenta, with background text. */
@define-color warning_color {{ yellow }};
@define-color error_color {{ red }};
@define-color success_color {{ green }};
@define-color warning_bg_color {{ yellow }};
@define-color warning_fg_color {{ background }};
@define-color error_bg_color {{ red }};
@define-color error_fg_color {{ background }};
@define-color info_bg_color {{ blue }};
@define-color info_fg_color {{ background }};
@define-color question_bg_color {{ magenta }};
@define-color question_fg_color {{ background }};

/* Window decorations: title text, frame, and title-bar button hover and press. */
@define-color wm_title {{ foreground }};
@define-color wm_unfocused_title {{ muted }};
@define-color wm_bg_a {{ dark_background }};
@define-color wm_bg_b {{ dark_background }};
@define-color wm_shadow {{ dark_background }};
@define-color wm_border {{ darker_background }};
@define-color wm_borders_edge {{ darker_background }};
@define-color wm_highlight {{ darker_background }};
@define-color wm_button_hover_color_a {{ lighter_background }};
@define-color wm_button_hover_color_b {{ lighter_background }};
@define-color wm_button_active_color_a {{ selection }};
@define-color wm_button_active_color_b {{ selection }};
@define-color wm_button_active_color_c {{ selection }};

/* In-app notifications: dark_background, darker_background edge. */
@define-color app_notification_a {{ dark_background }};
@define-color app_notification_b {{ dark_background }};
@define-color app_notification_c {{ dark_background }};
@define-color app_notification_border {{ darker_background }};

/* ---- Widget rules ----
   GTK3's Adwaita derives several colours from shades and mixes of the named colours above,
   which land on colours that belong to no palette slot. The rules below set solid palette
   colours instead. User CSS outranks the theme's own, so plain selectors are enough. */

/* Header bars and title bars: dark_background, foreground text, darker_background edge. */
headerbar, .titlebar, .csd .titlebar { background: {{ dark_background }}; color: {{ foreground }}; border-color: {{ darker_background }}; box-shadow: none; }

/* Sidebars (file chooser places list and others): dark_background. */
.sidebar, placessidebar, placessidebar row { background: {{ dark_background }}; }

/* Sidebar rows: selected on selection with bright_foreground text, hovered on lighter_background. */
placessidebar row:selected, placessidebar row:selected:hover { background: {{ selection }}; color: {{ bright_foreground }}; }
placessidebar row:hover { background: {{ lighter_background }}; }

/* List rows: hovered on lighter_background (placed before the selected rule so a selected row keeps its colour under the pointer). */
list row:hover { background: {{ lighter_background }}; }

/* Selected rows in lists and trees (file chooser file list): selection, bright_foreground text. */
treeview.view:selected, treeview.view:selected:focus, list row:selected { background: {{ selection }}; color: {{ bright_foreground }}; }

/* Column headings in tree views: background, dark_foreground text, darker_background edge. */
treeview.view header button { background: {{ background }}; color: {{ dark_foreground }}; border-color: {{ darker_background }}; }

/* Separator lines: darker_background. */
separator { background: {{ darker_background }}; }

/* Frame outlines: darker_background. */
frame > border, .frame { border-color: {{ darker_background }}; }

/* Buttons at rest: dark_background, foreground text, dark_foreground border. */
button { background-image: none; background-color: {{ dark_background }}; color: {{ foreground }}; border: 1px solid {{ dark_foreground }}; box-shadow: none; text-shadow: none; }

/* Header bar, toolbar, path bar and flat buttons: bare at rest (placed before the state rules so hover, focus and press still apply). */
headerbar button.image-button, .titlebar button.image-button, headerbar button.titlebutton, .titlebar button.titlebutton, toolbar button, .path-bar button, button.flat { background-color: transparent; border-color: transparent; }

/* Button hover and focus: lighter_background, accent border plus inset shadow for a 2px accent ring. */
button:hover, button:focus { background-color: {{ lighter_background }}; border-color: {{ accent }}; box-shadow: inset 0 0 0 1px {{ accent }}; }

/* Button pressed or toggled on: selection, dark_foreground border. */
button:active, button:checked { background-color: {{ selection }}; border-color: {{ dark_foreground }}; box-shadow: none; }

/* Disabled button text: muted. */
button:disabled { color: {{ muted }}; }

/* Suggested and default buttons: accent, background text. */
button.suggested-action, button.default { background-color: {{ accent }}; color: {{ background }}; border-color: {{ accent }}; }

/* Suggested button hover and focus: 2px bright_foreground inset ring. */
button.suggested-action:hover, button.suggested-action:focus { box-shadow: inset 0 0 0 2px {{ bright_foreground }}; }

/* Destructive buttons: red, bright_foreground text. */
button.destructive-action { background-color: {{ red }}; color: {{ bright_foreground }}; border-color: {{ red }}; }

/* Destructive button hover and focus: bright_red with the accent ring. */
button.destructive-action:hover, button.destructive-action:focus { background-color: {{ bright_red }}; border-color: {{ accent }}; box-shadow: inset 0 0 0 1px {{ accent }}; }

/* Text fields: lighter_background, foreground text, dark_foreground border. */
entry { background-image: none; background-color: {{ lighter_background }}; color: {{ foreground }}; border: 1px solid {{ dark_foreground }}; box-shadow: none; }

/* Focused text field: accent border plus inset shadow. */
entry:focus { border-color: {{ accent }}; box-shadow: inset 0 0 0 1px {{ accent }}; }

/* Selected text in text fields: selection, bright_foreground text. */
entry selection { background: {{ selection }}; color: {{ bright_foreground }}; }

/* Menus and popovers: dark_background, foreground text, darker_background edge. */
menu, .menu, .context-menu, popover, popover.background { background-color: {{ dark_background }}; color: {{ foreground }}; border-color: {{ darker_background }}; }

/* Hovered menu items: lighter_background, foreground text. */
menuitem:hover, menu menuitem:hover { background-color: {{ lighter_background }}; color: {{ foreground }}; }

/* Disabled menu items and shortcut hints: muted. */
menuitem:disabled, menuitem accelerator { color: {{ muted }}; }

/* Scrollbar thumb: lighter_background at rest, accent on hover, bright_foreground while dragging. */
scrollbar slider { background-color: {{ lighter_background }}; }
scrollbar slider:hover { background-color: {{ accent }}; }
scrollbar slider:active { background-color: {{ bright_foreground }}; }

/* Scrollbar track: lighter_background. */
scrollbar trough { background-color: {{ lighter_background }}; }

/* Switch track: lighter_background off, accent on. */
switch { background-color: {{ lighter_background }}; border: none; box-shadow: none; }
switch:checked { background-color: {{ accent }}; }

/* Switch knob: background. */
switch slider { background-image: none; background-color: {{ background }}; border: none; box-shadow: none; }

/* Tooltips: dark_background, foreground text, darker_background border. */
tooltip, tooltip.background { background-color: {{ dark_background }}; color: {{ foreground }}; border: 1px solid {{ darker_background }}; text-shadow: none; }
tooltip * { color: {{ foreground }}; text-shadow: none; }

/* Dim text (secondary labels): muted at full opacity. */
.dim-label { color: {{ muted }}; opacity: 1; }

/* Selected text in text views and labels: selection, bright_foreground text. */
textview text selection, label selection { background: {{ selection }}; color: {{ bright_foreground }}; }

/* ---- Widgets Adwaita paints with fixed colours ----
   GTK3's Adwaita-dark writes most widget colours as fixed values that the named colours above
   never reach, so each widget needs its own rule. User CSS also outranks Adwaita's
   unfocused-window (backdrop) rules, so these colours stay the same when a window loses focus. */

/* Windows and dialogs: background, foreground text. */
window, .background, dialog { background-color: {{ background }}; color: {{ foreground }}; }

/* Popup menu windows: transparent (placed after the window rule, which would otherwise fill them). */
.background.popup { background-color: transparent; }

/* Views (file chooser file list, icon grids, text areas, lists): background, foreground text, bright_foreground caret. */
.view, iconview, .view text, iconview text, textview text, textview, treeview.view, list, .content-view { background-color: {{ background }}; color: {{ foreground }}; caret-color: {{ bright_foreground }}; }

/* Lists inside sidebars and popovers: transparent, so the sidebar or popover colour shows. */
.sidebar list, placessidebar list, popover.background > list, popover.background > .view, popover.background > iconview { background-color: transparent; }

/* Disabled views: muted text. */
.view:disabled, treeview.view:disabled, iconview:disabled, textview text:disabled { color: {{ muted }}; background-color: {{ background }}; }

/* Selected items and text in views: selection, bright_foreground text. */
.view:selected, .view:selected:focus, iconview:selected, iconview:selected:focus, .view text:selected, textview text:selected, iconview text:selected { background-color: {{ selection }}; color: {{ bright_foreground }}; }

/* Tree view grid and tree lines: darker_background. */
treeview.view { border-left-color: {{ darker_background }}; border-top-color: {{ darker_background }}; }

/* Tree view lines on selected rows: selection. */
treeview.view:selected { border-left-color: {{ selection }}; border-top-color: {{ selection }}; }

/* Tree view expander arrows: muted at rest, foreground on hover. */
treeview.view.expander { color: {{ muted }}; }
treeview.view.expander:hover { color: {{ foreground }}; }

/* Tree view separator rows: darker_background. */
treeview.view.separator { color: {{ darker_background }}; }

/* Sidebar rows in an unfocused window: foreground text (selected rows keep bright_foreground). */
placessidebar row:backdrop:not(:selected) { color: {{ foreground }}; }

/* Check boxes and radio buttons: dark_background, dark_foreground border, foreground mark. */
check, radio { background-image: none; background-color: {{ dark_background }}; border: 1px solid {{ dark_foreground }}; box-shadow: none; color: {{ foreground }}; }

/* Check box and radio hover and focus: lighter_background, accent border (placed before the checked rule so a ticked box keeps its colour under the pointer). */
check:hover, radio:hover, check:focus, radio:focus { background-color: {{ lighter_background }}; border-color: {{ accent }}; }

/* Ticked and mixed check boxes and radios: accent, background mark. */
check:checked, radio:checked, check:indeterminate, radio:indeterminate { background-image: none; background-color: {{ accent }}; border-color: {{ accent }}; color: {{ background }}; }

/* Ticked check box and radio hover: bright_foreground inset ring. */
check:checked:hover, radio:checked:hover { box-shadow: inset 0 0 0 1px {{ bright_foreground }}; }

/* Disabled check boxes and radios: background, muted border and mark. */
check:disabled, radio:disabled { background-color: {{ background }}; border-color: {{ muted }}; color: {{ muted }}; }

/* Slider track: lighter_background. */
scale trough { background-color: {{ lighter_background }}; border: none; box-shadow: none; }

/* Slider filled part: accent. */
scale highlight, scale fill { background-color: {{ accent }}; border: none; }

/* Slider knob: background, dark_foreground border. */
scale slider { background-image: none; background-color: {{ background }}; border: 1px solid {{ dark_foreground }}; box-shadow: none; }

/* Slider knob hover and focus: accent border. */
scale slider:hover, scale slider:focus { border-color: {{ accent }}; }

/* Slider knob while dragging: selection. */
scale slider:active { background-color: {{ selection }}; }

/* Progress and level bar tracks: lighter_background. */
progressbar trough, levelbar trough { background-color: {{ lighter_background }}; border: none; }

/* Progress and level bar fill: accent. */
progressbar progress, levelbar block.filled { background-color: {{ accent }}; border: none; }

/* Empty level bar blocks: lighter_background. */
levelbar block.empty { background-color: {{ lighter_background }}; }

/* Progress bar percentage text: muted. */
progressbar text { color: {{ muted }}; }

/* Notebook tab strip: dark_background, darker_background edge. */
notebook > header { background-color: {{ dark_background }}; border-color: {{ darker_background }}; }

/* Notebook tabs: muted text on the tab strip. */
notebook > header tab { color: {{ muted }}; background-color: transparent; text-shadow: none; }

/* Notebook tab hover: lighter_background, foreground text (placed before the open-tab rule so the open tab keeps its colour under the pointer). */
notebook > header tab:hover { color: {{ foreground }}; background-color: {{ lighter_background }}; }

/* Open notebook tab: background, foreground text, 2px accent underline. */
notebook > header tab:checked { color: {{ foreground }}; background-color: {{ background }}; box-shadow: inset 0 -2px {{ accent }}; }

/* Notebook page area: background. */
notebook > stack:not(:only-child) { background-color: {{ background }}; }

/* Info bars: dark_background, foreground text, no border. */
infobar > revealer > box { background-color: {{ dark_background }}; color: {{ foreground }}; border: none; }

/* Info bar kinds: info blue, warning yellow, error red, question magenta, all with background text. */
infobar.info > revealer > box { background-color: {{ blue }}; color: {{ background }}; }
infobar.warning > revealer > box { background-color: {{ yellow }}; color: {{ background }}; }
infobar.error > revealer > box { background-color: {{ red }}; color: {{ background }}; }
infobar.question > revealer > box { background-color: {{ magenta }}; color: {{ background }}; }

/* Info bar text: inherits the bar's or the button's text colour. */
infobar label { color: inherit; text-shadow: none; }

/* Spin buttons: lighter_background, foreground text, dark_foreground border, like text fields. */
spinbutton { background-image: none; background-color: {{ lighter_background }}; color: {{ foreground }}; border: 1px solid {{ dark_foreground }}; box-shadow: none; }

/* Focused spin button: accent border plus inset shadow, like text fields. */
spinbutton:focus { border-color: {{ accent }}; box-shadow: inset 0 0 0 1px {{ accent }}; }

/* Spin button number area: no fill or border of its own (the text field rule would draw a second box inside). */
spinbutton entry, spinbutton entry:focus { background-color: transparent; border: none; box-shadow: none; }

/* Spin button +/- buttons: bare, foreground text, no ring when the spin button has focus. */
spinbutton button, spinbutton button:focus { background-color: transparent; border: none; box-shadow: none; color: {{ foreground }}; text-shadow: none; }

/* Spin button +/- hover: lighter_background, no ring. */
spinbutton button:hover { background-color: {{ lighter_background }}; box-shadow: none; }

/* Pane dividers: darker_background on the 1px line only, not the wider grab area around it. */
paned > separator { background-clip: content-box; }

/* Links and link buttons: accent; visited: magenta. */
*:link, link, button:link > label { color: {{ accent }}; }
*:visited, link:visited, button:visited > label { color: {{ magenta }}; }

/* Selected text in views: selection, bright_foreground text. */
.view selection { background-color: {{ selection }}; color: {{ bright_foreground }}; }

/* Dialog button rows and action bars: dark_background, darker_background edge. */
filechooser .dialog-action-area, .dialog-action-area, actionbar > revealer > box, .action-bar { background-color: {{ dark_background }}; border-color: {{ darker_background }}; }

/* Search bars: dark_background, darker_background edge. */
searchbar > revealer > box, .search-bar { background-color: {{ dark_background }}; border-color: {{ darker_background }}; }

/* Overscroll glow at the ends of scrolled areas: none. */
scrolledwindow overshoot.top, scrolledwindow overshoot.bottom, scrolledwindow overshoot.left, scrolledwindow overshoot.right { background: none; box-shadow: none; }

/* Popup menu frame: darker_background border, no shadow. */
.csd.popup decoration { box-shadow: none; border: 1px solid {{ darker_background }}; }

/* Keyboard focus: GTK3 draws a dashed outline on the focused control or row; the controls above already
   show focus as the hover look, and rows take the hover fill, so no dashes. */
button, entry, spinbutton, check, radio, switch, scale slider, menuitem, notebook > header tab, treeview.view, .view, iconview, list row, placessidebar row, flowboxchild { outline-style: none; }
placessidebar row:focus:not(:selected), list row:focus:not(:selected) { background-color: {{ lighter_background }}; }
