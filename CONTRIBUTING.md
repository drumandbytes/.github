# Contributing

Thanks for taking the time to contribute. These are the default guidelines for
repositories in the **drumandbytes** organization; a repo with its own
`CONTRIBUTING.md` overrides this one.

## Before you start

- **Open an issue first** for anything non-trivial — a bug you plan to fix, a
  feature, a refactor. It avoids wasted work if the change isn't a good fit.
- Small, obvious fixes (typos, broken links, one-line bugs) can go straight to a
  pull request.
- Check existing issues and pull requests first.

## Pull requests

- Branch off the default branch; one logical change per branch.
- Keep the diff focused — unrelated cleanups belong in their own PR.
- Follow the existing code style of the repo. If it has linters or formatters
  configured, run them.
- Update documentation and tests alongside the code.
- Write [Conventional Commit](https://www.conventionalcommits.org/) messages
  (`feat:`, `fix:`, `chore:`, `docs:` …).
- All CI checks must pass. Every repo requires the change to go through a pull
  request — direct pushes to the default branch are blocked org-wide.
- PRs are normally **squash-merged**, so the PR title becomes the commit message —
  make it a clean Conventional Commit line.

## Reviews

This is a single-maintainer org, so PRs are not blocked on a second approval, but
they are still reviewed before merge. Expect a first response within a few days.

## Licence

Unless a repository states otherwise, contributions are accepted under that
repository's licence (MIT for most).
