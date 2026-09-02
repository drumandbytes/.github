# Social preview cards

1280×640 type-only cards for the repos that get shared externally. They give
`github.com/drumandbytes/*` links a consistent branded unfurl instead of
GitHub's auto-generated counter card.

## Not automated — upload each one by hand

A repo's social preview image is a GitHub **setting**, not a file in the repo.
There is no API for it. For each PNG below:

**`<repo> → Settings → General → Social preview → Edit → Upload an image`**

| File | Upload to |
|---|---|
| `eraser.png` | `drumandbytes/eraser` |
| `f1-walk.png` | `drumandbytes/f1-walk` |
| `road-conditions-ee.png` | `drumandbytes/road-conditions-ee` |
| `opentofu-updater-action.png` | `drumandbytes/opentofu-updater-action` |
| `argocd-gitops-updater-action.png` | `drumandbytes/argocd-gitops-updater-action` |

Verify with [opengraph.xyz](https://www.opengraph.xyz/) or by pasting the repo
URL into Slack. Platforms cache unfurls, so an old card may linger.

The org page (`github.com/drumandbytes`) can't have a custom one — that's a
repo-only setting.

## Regenerating

```sh
./generate.sh
```

Requires ImageMagick 7. Edit the tagline table at the bottom of the script;
keep taglines to ~1–2 lines. The design is deliberately minimal (dark ground,
orange accent bar matching `drumandbytes.com`, repo name + tagline) so the
whole set reads as one system.
