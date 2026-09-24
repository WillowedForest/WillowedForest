# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
. "$HOME/.cargo/env"


# Added by Toolbox App
export PATH="$PATH:/home/willow/.local/share/JetBrains/Toolbox/scripts"

export PATH="$HOME/.diversion/bin:$PATH"

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"
