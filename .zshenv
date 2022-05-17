typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")

export CONFIGDIR="$HOME/.config"
export ZDOTDIR="$CONFIGDIR/zsh"

# env for applications
export EDITOR="nvim"
export BROWSER="firefox"

#.Net
export DOTNET_ROOT="$HOME/.dotnet"
export PATH=$PATH:$DOTNET_ROOT
export PATH=$PATH:"$DOTNET_ROOT/tools"

# Golang
export GOPATH="$HOME/go"
export PATH=$PATH:"$GOPATH/bin"

# flutter
export PATH=$PATH:"$HOME/.local/src/flutter/bin"

# android sdk
export ANDROID_SDK_ROOT="$HOME/.local/bin/android-sdk"
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# QT theming
# export QT_QPA_PLATFORMTHEME=gtk2

. "$HOME/.cargo/env"
