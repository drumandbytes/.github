#!/bin/bash
# Regenerate the org's social preview cards (1280x640, type-only).
#
# These are NOT referenced by anything — a repo's social preview image is a
# GitHub setting, uploaded by hand at Settings -> General -> Social preview.
# This script just keeps the set reproducible and consistent. After running,
# upload each PNG to the matching repo.
#
# Requires ImageMagick 7 (`magick`). Font paths below are macOS; override
# FONT_BOLD / FONT_REG for other platforms.
set -euo pipefail
cd "$(dirname "$0")"

FONT_BOLD="${FONT_BOLD:-/System/Library/Fonts/Supplemental/Arial Bold.ttf}"
FONT_REG="${FONT_REG:-/System/Library/Fonts/SFNS.ttf}"

W=1280; H=640
BG="#0D1117"; ACCENT="#FF6633"
NAME_COL="#FFFFFF"; TAG_COL="#8B98A5"; FOOT_COL="#5B6B82"
M=100; NAME_PT=62; TAG_PT=31; GAP=30

card() { # <slug> <tagline>
  local slug="$1" tag="$2" out="$1.png"
  magick -size ${W}x${H} xc:"$BG" -fill "$ACCENT" -draw "rectangle 0,0 14,${H}" PNG:/tmp/_s_base.png
  magick -background none -fill "$NAME_COL" -font "$FONT_BOLD" -pointsize $NAME_PT \
    label:"$slug" -trim +repage PNG:/tmp/_s_name.png
  magick -background none -fill "$TAG_COL" -font "$FONT_REG" -pointsize $TAG_PT \
    -interline-spacing 10 -size 980x caption:"$tag" -trim +repage \
    -background none -splice 0x${GAP} PNG:/tmp/_s_tag.png
  magick -background none -fill "$FOOT_COL" -font "$FONT_REG" -pointsize 25 \
    label:"drumandbytes.com" PNG:/tmp/_s_foot.png
  magick /tmp/_s_base.png \
    \( /tmp/_s_name.png /tmp/_s_tag.png -background none -gravity West -append \) \
    -gravity West -geometry +${M}+0 -composite \
    /tmp/_s_foot.png -gravity SouthWest -geometry +${M}+60 -composite \
    "$out"
  echo "wrote $out"
}

card "eraser" \
  "Free, open-source data-broker removal — automated GDPR / CCPA opt-out requests to 700+ brokers."
card "f1-walk" \
  "Fan-made PWA walking guides to real F1 street circuits. GPS tracking, corner-by-corner history, offline support."
card "road-conditions-ee" \
  "Teesilm — a faster, offline-capable PWA for Estonian road and weather conditions."
card "opentofu-updater-action" \
  "Keeps OpenTofu / Terraform providers, modules, Helm charts and images up to date via pull requests."
card "argocd-gitops-updater-action" \
  "Automated Helm chart and image version bumps for GitOps repos. ArgoCD and Kustomize aware."
