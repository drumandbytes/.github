#!/bin/bash
# Build every card listed in cards.tsv.  Tab-separated columns:
#   slug <TAB> device <TAB> screenshot-path <TAB> tagline
# device: none | phone | tablet | laptop   (screenshot-path empty when none)
set -euo pipefail
cd "$(dirname "$0")"

TAB=$'\t'
while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in ''|'#'*) continue ;; esac
  slug=${line%%"$TAB"*};   rest=${line#*"$TAB"}
  device=${rest%%"$TAB"*}; rest=${rest#*"$TAB"}
  shot=${rest%%"$TAB"*};   tagline=${rest#*"$TAB"}
  ./build.sh "$slug" "$tagline" "${device:-none}" "$shot"
done < cards.tsv

echo
echo "Cards in ./out/ — upload each to <repo> Settings -> General -> Social preview."
