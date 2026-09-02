#!/bin/bash
# Social-preview card generator: HTML template -> headless screenshot.
#
#   ./build.sh <slug> "<tagline>" [device] [screenshot.png]
#
# device:
#   none    (default) — type only
#   phone | tablet | laptop — one framed screenshot on the right
#   stacked — two phones, screenshots/<slug>-back.png behind screenshots/<slug>.png
#
# Needs a Chromium (BROWSER env) for --screenshot; `magick` only for the montage.
# Output: out/<slug>.png (1280x640).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p out

BROWSER="${BROWSER:-/Applications/Brave Browser.app/Contents/MacOS/Brave Browser}"

slug="$1"; tag="$2"; device="${3:-none}"; shot="${4:-}"

case "$device" in
  none) TEXT_W=1040; NAME_SIZE=62 ;;
  *)    TEXT_W=560;  NAME_SIZE=54 ;;
esac

# base64 data-URI for a screenshot (png or jpg)
datauri() { # <path>
  case "$1" in *.jpg|*.jpeg) m=image/jpeg ;; *) m=image/png ;; esac
  printf 'data:%s;base64,%s' "$m" "$(base64 -i "$1" | tr -d '\n')"
}

# one devices.css phone/tablet/laptop element wrapping a screenshot data-URI
emit_device() { # <css-class> <data-uri> <inline-style>
  cat <<HTML
  <div class="device $1" style="$3">
    <div class="device-frame">
      <div class="device-screen" style="background-image:url($2)"></div>
    </div>
    <div class="device-stripe"></div><div class="device-header"></div>
    <div class="device-sensors"></div><div class="device-btns"></div><div class="device-power"></div>
    <div class="device-home"></div>
  </div>
HTML
}

first_existing() { for f in "$@"; do [ -f "$f" ] && { echo "$f"; return; }; done; }

stage=""
case "$device" in
  none) ;;
  stacked)
    back=$(first_existing "screenshots/${slug}-back.jpg" "screenshots/${slug}-back.png")
    front=$(first_existing "screenshots/${slug}.jpg" "screenshots/${slug}.png")
    [ -n "$back" ] && [ -n "$front" ] || { echo "stacked needs screenshots/${slug}-back.* and screenshots/${slug}.*" >&2; exit 1; }
    bb=$(datauri "$back"); bf=$(datauri "$front")
    stage="<div class=\"stage stacked\">
      $(emit_device device-iphone-14 "$bb" "--s:.47; --rot:-11deg; --tx:-150px; --ty:-30px; z-index:1; filter:brightness(.72) drop-shadow(0 30px 50px rgba(0,0,0,.55));")
      $(emit_device device-iphone-14 "$bf" "--s:.55; --rot:-2deg; --tx:-30px; --ty:26px; z-index:2; filter:drop-shadow(0 45px 70px rgba(0,0,0,.6));")
    </div>"
    ;;
  phone|tablet|laptop)
    [ -n "$shot" ] && [ -f "$shot" ] || { echo "$device needs a screenshot path" >&2; exit 1; }
    b64=$(datauri "$shot")
    case "$device" in
      phone)  cls=device-iphone-14;   st="--s:.64; --rot:-2deg; --ty:-14px;" ;;
      tablet) cls=device-ipad-pro;    st="--s:.50; --rot:-2deg; --ty:-14px;" ;;
      laptop) cls=device-macbook-pro; st="--s:.62; --rot:0deg;  --ty:0;" ;;
    esac
    st="$st filter:drop-shadow(0 45px 70px rgba(0,0,0,.6));"
    stage="<div class=\"stage\">$(emit_device "$cls" "$b64" "$st")</div>"
    ;;
  *) echo "unknown device: $device" >&2; exit 1 ;;
esac

esc() { python3 -c 'import html,sys;print(html.escape(sys.argv[1]))' "$1"; }

sed -e "s|__NAME__|$(esc "$slug")|g" \
    -e "s|__TAG__|$(esc "$tag")|g" \
    -e "s|__TEXT_W__|${TEXT_W}px|g" \
    -e "s|__NAME_SIZE__|${NAME_SIZE}px|g" \
    template.html > /tmp/_card.html
# $stage can be ~MB (embedded base64 images) — pass via file, not argv
printf '%s' "$stage" > /tmp/_stage.html
python3 - <<'PY'
import pathlib
card = pathlib.Path("/tmp/_card.html")
stage = pathlib.Path("/tmp/_stage.html").read_text()
card.write_text(card.read_text().replace("__STAGE__", stage))
PY
cp devices.min.css /tmp/devices.min.css

"$BROWSER" --headless=new --hide-scrollbars --force-device-scale-factor=1 \
  --window-size=1280,640 --default-background-color=00000000 \
  --virtual-time-budget=4000 --screenshot="out/$slug.png" "file:///tmp/_card.html" >/dev/null 2>&1

magick identify "out/$slug.png" 2>/dev/null || echo "wrote out/$slug.png"
