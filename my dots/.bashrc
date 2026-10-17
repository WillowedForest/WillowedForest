#exec zsh
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc
. "$HOME/.cargo/env"

#source paths below

# vulkan

source $HOME/Documents/vulkan/1.4.357.1/setup-env.sh


#export paths below:

#vulkan
export VULKAN_SDK=$HOME/Documents/vulkan/1.4.357.1/x86_64


#odin
export PATH="$HOME/Documents/odin:$PATH"

#zig
#export PATH="$HOME/Documents/zig:$PATH"

#diversion
export PATH="$HOME/.diversion/bin:$PATH"
export PATH="$HOME/.diversion/bin:$PATH"

# unreals fucking sucks
export SDL_VIDEODRIVER=x11
export RADV_DEBUG=zerovram

# .NET SDK Configuration
export DOTNET_ROOT="/usr/share/dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Disable analytics
export DOTNET_ROLL_FORWARD_TO_PRERELEASE=1

# Add the .NET SDK to the system paths so we can use the `dotnet` tool.
export PATH="$DOTNET_ROOT:$PATH"
export PATH="$DOTNET_ROOT/sdk:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# Aliases below:
alias in="sudo dnf install"
alias rv="sudo dnf remove"
alias search="sudo dnf search"
alias docker="sudo docker"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias commit="git commit -m"
alias push="git push"
alias add="git add ."
alias unreal='RADV_DEBUG=zerovram SDL_VIDEODRIVER=x11 $HOME/Documents/unreal-engines/UnrealEngine/Engine/Binaries/Linux/UnrealEditor'
alias umu='WINEPREFIX="$HOME/Games/umu/umu-default" PROTONPATH="$HOME/.local/share/Steam/compatibilitytools.d/Proton-GE Latest" umu-run'

# Run this if you ever run into errors while doing a `dotnet restore`
alias nugetclean="dotnet nuget locals --clear all"

hyfetch --ascii-file "$HOME/.config/fastfetch/cat.txt"

if [ -f ~/.weather_cache ]; then
    cat ~/.weather_cache
fi
. "$HOME/.config/godotenv/env" # Added by GodotEnv

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"
