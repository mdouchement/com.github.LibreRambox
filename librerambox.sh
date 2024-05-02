#!/bin/sh

EXTRA_ARGS=()

declare -i LIBRERAMBOX_USE_TRAY_ICON="${LIBRERAMBOX_USE_TRAY_ICON:-0}"
declare -i LIBRERAMBOX_START_IN_TRAY="${LIBRERAMBOX_START_IN_TRAY:-0}"
declare -i LIBRERAMBOX_USE_WAYLAND="${LIBRERAMBOX_USE_WAYLAND:-0}"
declare -i LIBRERAMBOX_DISABLE_GPU="${LIBRERAMBOX_DISABLE_GPU:-0}"
declare -i LIBRERAMBOX_DISABLE_GPU_SANDBOX="${LIBRERAMBOX_DISABLE_GPU_SANDBOX:-0}"

# Additional args for tray icon
if [[ "${LIBRERAMBOX_USE_TRAY_ICON}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--use-tray-icon"
    )
fi
if [[ "${LIBRERAMBOX_START_IN_TRAY}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--start-in-tray"
    )
fi

if [[ "${LIBRERAMBOX_USE_WAYLAND}" -eq 1 && "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    EXTRA_ARGS+=(
        "--enable-features=WaylandWindowDecorations"
        "--ozone-platform=wayland"
    )
fi

if [[ "${LIBRERAMBOX_DISABLE_GPU}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--disable-gpu"
    )
fi

if [[ "${LIBRERAMBOX_DISABLE_GPU_SANDBOX}" -eq 1 ]]; then
    EXTRA_ARGS+=(
        "--disable-gpu-sandbox"
    )
fi


echo "Debug: Will run LibreRambox with the following arguments:" "${EXTRA_ARGS[@]}"
echo "Debug: Additionally, user gave: $*"

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
exec zypak-wrapper "/app/LibreRambox/librerambox" "${EXTRA_ARGS[@]}" "$@"
