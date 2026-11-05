# Wolf Pack branding for Omarchy

The original Wolf Pack text artwork from my Omarchy screensaver, with a small installer for moving it to another machine.

## Install

On an existing Omarchy installation, run as your regular desktop user:

```bash
git clone https://github.com/boodaah3d/wolf-pack-branding.git
cd wolf-pack-branding
./install.sh
```

The installer copies `branding/screensaver.txt` to `~/.config/omarchy/branding/screensaver.txt`. Any different existing artwork is backed up alongside it as `screensaver.txt.before-wolf-pack.<timestamp>.<pid>`. Running the installer again with the same artwork makes no changes. No sudo, package changes, or desktop restart are needed.

The artwork appears the next time the screensaver starts. To preview immediately on Omarchy, run:

```bash
omarchy launch screensaver force
```

Move the mouse or press a key to exit the preview.

## Restore previous branding

Find the backup path printed by the installer, then restore that exact file:

```bash
ls ~/.config/omarchy/branding/screensaver.txt.before-wolf-pack.*
cp -- ~/.config/omarchy/branding/screensaver.txt.before-wolf-pack.REPLACE_WITH_YOUR_BACKUP_SUFFIX \
  ~/.config/omarchy/branding/screensaver.txt
```

If the installer did not find an existing file, it creates no backup. In that case, remove the installed file and restore the default artwork using your Omarchy version's branding setup before launching the screensaver again.

## Scope and compatibility

This repository contains only the screensaver artwork. It does not change the About logo, theme, idle timeout, terminal settings, or screensaver effects, and it never edits `/usr/share/omarchy`.

Exported from Omarchy `4.0.0.alpha`. The installed screensaver on that system reads `~/.config/omarchy/branding/screensaver.txt` directly. Other Omarchy versions must support that same customization path; this installer does not patch the screensaver program.

Keep this clone to edit the artwork or pull future changes, then run `./install.sh` again.
