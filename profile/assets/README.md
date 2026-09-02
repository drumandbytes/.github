# Profile assets

Images used by the org profile page and org-level branding.

| File | Purpose |
|---|---|
| `banner.webp` | 1400×760 banner at the top of [`profile/README.md`](../README.md). |
| `dnb-robot.svg` | Source logo for the `dnb-robot` GitHub App (the org's automation bot). Geometric robot head — `#0D1117` ground, `#FFFFFF` mark, `#FF6633` accent, matching [`profile/social/`](../social/README.md). |
| `dnb-robot.png` | 512×512 raster of `dnb-robot.svg`, sized for the GitHub App avatar. |

## Regenerating `dnb-robot.png`

After editing the SVG, re-render the PNG with headless Brave (the same tool
`profile/social/build.sh` uses):

```sh
cd profile/assets
"/Applications/Brave Browser.app/Contents/MacOS/Brave Browser" --headless=new \
  --hide-scrollbars --force-device-scale-factor=1 --window-size=512,512 \
  --default-background-color=00000000 --virtual-time-budget=2000 \
  --screenshot=dnb-robot.png "file://$PWD/dnb-robot.svg"
```

Fallback with ImageMagick: `magick -background none -density 384 dnb-robot.svg -resize 512x512 dnb-robot.png`.

## Using the logo as the bot avatar

The `dnb-robot` GitHub App is **not** managed in `dnb-tf` — its avatar is set by
hand. Upload `dnb-robot.png` at **Settings → Developer settings → GitHub Apps →
dnb-robot → Display information → Logo**. The committed files here are the source
of truth.
