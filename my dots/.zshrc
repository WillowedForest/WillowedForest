#
# .zshrc is sourced in interactive shells.
#

# Completion
autoload -U compinit
compinit

# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Other shell options
setopt AUTOCD
unsetopt NOMATCH

# Initialize Starship
eval "$(starship init zsh)"

# Syntax highlighting and autosuggestions
[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf key bindings
[[ -r /usr/share/fzf/shell/key-bindings.zsh ]] &&
    source /usr/share/fzf/shell/key-bindings.zsh

# Ctrl + Arrow key bindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Ctrl + Backspace/Delete key bindings
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# Alt + Backspace/Delete key bindings
bindkey "^[[3~" delete-char
bindkey -M emacs '^[[3;3~' kill-word

# User-specific environment
for dir in "$HOME/.local/bin" "$HOME/bin"; do
    if [[ -d "$dir" && ! ":$PATH:" == *":$dir:"* ]]; then
        path=("$dir" $path)
    fi
done

# Rust
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Vulkan
[[ -f "$HOME/Documents/vulkan/1.4.357.1/setup-env.sh" ]] &&
    source "$HOME/Documents/vulkan/1.4.357.1/setup-env.sh"
export VULKAN_SDK="$HOME/Documents/vulkan/1.4.357.1/x86_64"

# Odin
export PATH="$HOME/Documents/odin:$PATH"

# Zig
 export PATH="$HOME/Documents/zig:$PATH"

# Diversion
export PATH="$HOME/.diversion/bin:$PATH"

# Unreal Engine / graphics
export SDL_VIDEODRIVER=x11
export RADV_DEBUG=zerovram

# .NET SDK
export DOTNET_ROOT="/usr/share/dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROLL_FORWARD_TO_PRERELEASE=1
export PATH="$HOME/.dotnet/tools:$DOTNET_ROOT/sdk:$DOTNET_ROOT:$PATH"

# Load optional Zsh config snippets
if [[ -d "$HOME/.zshrc.d" ]]; then
    for rc in "$HOME"/.zshrc.d/*(N.); do
        source "$rc"
    done
fi
unset rc

# Aliases
alias in="sudo dnf install"
alias rv="sudo dnf remove"
alias search="sudo dnf search"
alias docker="sudo docker"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias commit="git commit -m"
alias add="git add ."
alias unreal='RADV_DEBUG=zerovram SDL_VIDEODRIVER=x11 "$HOME/Documents/unreal-engines/UnrealEngine/Engine/Binaries/Linux/UnrealEditor"'
alias umu='WINEPREFIX="$HOME/Games/umu/umu-default" PROTONPATH="$HOME/.local/share/Steam/compatibilitytools.d/Proton-GE Latest" umu-run'
alias nugetclean="dotnet nuget locals --clear all"

# Startup display and cached weather
[[ -f "$HOME/.config/fastfetch/cat.txt" ]] &&
    hyfetch --ascii-file "$HOME/.config/fastfetch/cat.txt"
[[ -f "$HOME/.weather_cache" ]] && cat "$HOME/.weather_cache"

# GodotEnv
[[ -f "$HOME/.config/godotenv/env" ]] &&
    source "$HOME/.config/godotenv/env"

# Vite+ bin
[[ -f "$HOME/.vite-plus/env" ]] &&
    source "$HOME/.vite-plus/env"
