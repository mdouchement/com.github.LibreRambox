# LibreRambox

This repo hosts the flatpak version of [LibreRambox](https://github.com/LibreRambox/LibreRambox)

LibreRambox the Ultimate Open-Source Messaging & Emailing Fusion.

Note that this is an **unofficial** redistribution.

## Installing

```bash
flatpak install flathub com.github.LibreRambox
```

## Options
You can set the following environment variables:

* `LIBRERAMBOX_USE_TRAY_ICON=1`: Enables the tray icon
* `LIBRERAMBOX_START_IN_TRAY=1`: Starts in tray
* `LIBRERAMBOX_USE_WAYLAND=1`: Enables Wayland support
* `LIBRERAMBOX_DISABLE_GPU=1`: Disables GPU acceleration
* `LIBRERAMBOX_DISABLE_GPU_SANDBOX=1`: Disables GPU sandbox

## Wayland
The integration between Chromium, Electron, and Wayland seems broken.
Adding an additional layer of complexity like Flatpak can't help.
For now, using this repo with wayland should be regarded as experimental.

Wayland support can be enabled with `LIBRERAMBOX_USE_WAYLAND=1` in [Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal).

Wayland support can also be enabled on the command line:

```bash
flatpak override --user --env=LIBRERAMBOX_USE_WAYLAND=1 com.github.LibreRambox
```

GPU acceleration may be need to be disabled:

```bash
flatpak override --user --env=LIBRERAMBOX_DISABLE_GPU=1 com.github.LibreRambox
```

Additionally, Nvidia devices may need the GPU sandbox disabled:

```bash
flatpak override --user --env=LIBRERAMBOX_DISABLE_GPU_SANDBOX=1 com.github.LibreRambox
```

## Issue reporting

**Please only report issues in this repo that are specific to the flatpak version.**

Issues that can be replicated in a stable release should be reported in the [upstream repo](https://github.com/LibreRambox/LibreRambox).
Make sure, that the reported issue is **not** flatpak-related.

## Development

```sh
flatpak-builder build-dir com.github.LibreRambox.yaml --force-clean
```

```sh
flatpak-builder --user --install --force-clean build-dir com.github.LibreRambox.yaml
```

```sh
flatpak run com.github.LibreRambox
```

## Other

This repository is heavily inspired from https://github.com/flathub/org.signal.Signal.
