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

#export paths below:

# .NET SDK Configuration
export DOTNET_ROOT="/usr/share/dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Disable analytics
export DOTNET_ROLL_FORWARD_TO_PRERELEASE=1
 
# Add the .NET SDK to the system paths so we can use the `dotnet` tool.
export PATH="$DOTNET_ROOT:$PATH"
export PATH="$DOTNET_ROOT/sdk:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# Aliases below:


alias install="sudo dnf install"
alias remove="sudo dnf remove"
alias search="sudo dnf search"
alias docker="sudo docker"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias commit="git commit -m"
alias push="git push"
alias add="git add ."
 
# Run this if you ever run into errors while doing a `dotnet restore`
alias nugetclean="dotnet nuget locals --clear all"

hyfetch --ascii-file "/home/willow/.config/fastfetch/cat.txt"

if [ -f ~/.weather_cache ]; then
    cat ~/.weather_cache
fi
. "$HOME/.config/godotenv/env" # Added by GodotEnv

