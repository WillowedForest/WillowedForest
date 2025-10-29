#!/usr/bin/env bash
# ------------------------------------------------------------
#  update_weather.sh
#
#  Fetches the Leeds weather from wttr.in in the requested
#  format and writes it to ~/.weather_cache only if the
#  new value differs from the cached one.
#
#  (c) 2025 Willow
# ------------------------------------------------------------

set -euo pipefail          # safer Bash behaviour

# ---------- configuration ----------
CACHE_FILE="/home/willow/.weather_cache"
URL="https://wttr.in/leeds?format=2"

# ---------- 1. Grab the new weather string ----------
# -f   : fail silently on HTTP errors (4xx, 5xx)
# -s   : silent mode – no progress bar
# -S   : show the error if -f fails (so we see why it broke)
weather=$(curl -fsS "$URL")   || { echo "❌  curl failed: cannot fetch weather" >&2; exit 1; }

# ---------- 2. Decide whether we must write ----------
if [[ ! -f "$CACHE_FILE" ]] || [[ "$weather" != "$(cat "$CACHE_FILE")" ]]; then
    # Different (or file missing) – update the cache
    # We write atomically with a temporary file and mv.
    tmp=$(mktemp) || { echo "❌  cannot create temp file" >&2; exit 1; }
    printf '%s\n' "$weather" >"$tmp"
    mv "$tmp" "$CACHE_FILE"
    echo "✅  Weather cache updated."
else
    # Nothing changed – leave the cache untouched
    echo "ℹ️   Weather cache unchanged."
fi