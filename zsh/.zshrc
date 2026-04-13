# ── Prompt ──────────────────────────────────────────────
PROMPT='%B%F{white}%n%b%f %F{white}(%~)%f %F{white}>%f '

# ── History ─────────────────────────────────────────────
HISTSIZE=10000                   # lines kept in memory
SAVEHIST=10000                   # lines saved to disk
setopt HIST_IGNORE_DUPS          # don't save duplicate commands
setopt HIST_IGNORE_SPACE         # commands starting with space aren't saved

# ── Vi mode ─────────────────────────────────────────────
bindkey -v                       # enable vi keybinds in terminal
KEYTIMEOUT=1                     # faster mode switching (default is 400ms)

#  extendepd globbing
setopt extended_glob


export PATH="$HOME/.local/bin:$PATH"
