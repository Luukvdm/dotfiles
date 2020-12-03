if type dotnet &> /dev/null; then
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export PATH="$PATH:$HOME/.config/dotnet/.dotnet/tools"
fi

# Only on wayland!
if [ -n "$WAYLAND_DISPLAY" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM="xcb"
fi
