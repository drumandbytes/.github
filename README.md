# .github

Organization-level defaults for the **drumandbytes** GitHub org.

## What's in here

| Path | Purpose |
|---|---|
| [`profile/README.md`](profile/README.md) | Renders as the org landing page at [github.com/drumandbytes](https://github.com/drumandbytes). |
| [`profile/assets/`](profile/assets/) | Profile banner + the `dnb-robot` GitHub App logo (`dnb-robot.svg` source, `dnb-robot.png` avatar) — see its [README](profile/assets/README.md). |
| [`profile/scripts/update_profile.py`](profile/scripts/update_profile.py) | Regenerates the `BLOG-POSTS` block in the profile from the blog RSS feed. |
| [`.github/workflows/update-profile.yml`](.github/workflows/update-profile.yml) | Runs that script daily and commits the result (as the `dnb-robot` app). |
| [`.github/workflows/ci.yml`](.github/workflows/ci.yml) | actionlint + `ruff` + template validation on every PR; the gate for auto-merge. |
| [`.github/dependabot.yml`](.github/dependabot.yml) | Weekly grouped bumps for the actions used in `.github/workflows/`. |
| [`.github/workflows/dependabot-auto-merge.yml`](.github/workflows/dependabot-auto-merge.yml) | Enables auto-merge on a Dependabot PR once CI passes (via `reusable-actions`). |
| [`SECURITY.md`](SECURITY.md) | Default security policy. |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Default contribution guidelines. |
| [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) | Contributor Covenant 2.1. |
| [`SUPPORT.md`](SUPPORT.md) | Where to get help. |
| [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md) | Default PR template. |
| [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/) | Default issue forms + chooser config. |

## How the defaults work

GitHub automatically applies the community-health files above to **any repository
in the org that does not provide its own copy**. A repo with its own
`SECURITY.md`, `CONTRIBUTING.md`, issue templates, etc. always wins — nothing here
overrides a repo-local file.

`FUNDING.yml` is intentionally not included yet.

## Dependency updates

Dependabot opens one grouped PR a week for the actions pinned in
`.github/workflows/`. `ci.yml` runs on it; once green,
`dependabot-auto-merge.yml` enables auto-merge (squash) through the org's shared
`reusable-actions/auto-merge.yml`. Requires `allow_auto_merge` on this repo —
set it in `dnb-tf` alongside the other repo defaults.

## Editing the profile page

- The page lives in [`profile/README.md`](profile/README.md). Image `src`
  attributes use absolute `raw.githubusercontent.com/.../main/...` URLs so they
  resolve on the rendered org page.
- Preview locally with [`grip`](https://github.com/joeyespo/grip)
  (`grip profile/README.md`) or the editor's Markdown preview. Note that
  repo-hosted images only load once the change is on `main`.
- Changes go through a pull request (enforced org-wide).
- The **Latest from the blog** list between the `<!-- BLOG-POSTS:START -->` /
  `<!-- BLOG-POSTS:END -->` markers is generated — edit
  [`profile/scripts/update_profile.py`](profile/scripts/update_profile.py), not
  the list. Run it locally with `python3 profile/scripts/update_profile.py`, or
  trigger the **Update profile** workflow. It pushes straight to `main` as the
  `dnb-robot` app (the one bypass actor on the branch ruleset).

## License

[MIT](LICENSE). The community-health files are adapted from the Contributor
Covenant and standard templates; reuse them freely.
