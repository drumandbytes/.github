<p align="center">
  <img src="https://raw.githubusercontent.com/drumandbytes/.github/main/profile/assets/banner.webp" alt="Drum and Bytes" width="100%">
</p>

<h1 align="center">Drum and Bytes</h1>

<p align="center"><em>A techie's hideout — apps, infrastructure, and everything in between.</em></p>

<p align="center">
  <a href="https://drumandbytes.com/"><img src="https://img.shields.io/badge/Blog-drumandbytes.com-0b7285?style=flat-square&logo=ghost&logoColor=white" alt="Blog"></a>
  <a href="https://maris.popens.eu/"><img src="https://img.shields.io/badge/Portfolio-maris.popens.eu-5c7cfa?style=flat-square&logo=safari&logoColor=white" alt="Portfolio"></a>
  <a href="https://www.linkedin.com/in/marispopens/"><img src="https://img.shields.io/badge/LinkedIn-marispopens-0a66c2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a>
  <img src="https://img.shields.io/badge/Based%20in-Estonia-4c6ef5?style=flat-square" alt="Based in Estonia">
</p>

---

**Drum and Bytes** is the personal GitHub organization of [Māris Popēns](https://maris.popens.eu/) —
a data engineer based in Tallinn, Estonia. It's where side projects, homelab experiments, and
small tools graduate from *"works on my machine"* into something other people can run. Most of
it is open source under the MIT licence.

## Featured projects

### 🗺️ Apps & PWAs

- **[road-conditions-ee](https://github.com/drumandbytes/road-conditions-ee)** &nbsp;
  <a href="https://roadconditions.drumandbytes.ee"><img src="https://img.shields.io/badge/live-roadconditions.drumandbytes.ee-2b8a3e?style=flat-square" alt="Live site"></a>
  <img src="https://img.shields.io/github/last-commit/drumandbytes/road-conditions-ee?style=flat-square&label=updated" alt="Last commit">
  <br>
  *Teesilm* — a mobile-first PWA for Estonian road and weather conditions. Offline-capable,
  self-hosted vector maps, and precise location-based hazard alerts (a radius around a saved
  point, not a coarse region subscription).

- **[f1-walk](https://github.com/drumandbytes/f1-walk)** &nbsp;
  <a href="https://f1walk.drumandbytes.dev"><img src="https://img.shields.io/badge/live-f1walk.drumandbytes.dev-2b8a3e?style=flat-square" alt="Live site"></a>
  <img src="https://img.shields.io/github/last-commit/drumandbytes/f1-walk?style=flat-square&label=updated" alt="Last commit">
  <br>
  Fan-made walking guides to F1 street circuits — Monaco, Baku, Singapore, Las Vegas and
  Melbourne — with GPS tracking, corner-by-corner history, and offline support.

### 🛡️ Privacy

- **[eraser](https://github.com/drumandbytes/eraser)** &nbsp;
  <img src="https://img.shields.io/github/stars/drumandbytes/eraser?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/last-commit/drumandbytes/eraser?style=flat-square&label=updated" alt="Last commit">
  <br>
  Free, open-source data-broker removal. Sends GDPR/CCPA opt-out requests to 700+ brokers
  automatically — a maintained continuation of `digisamroc/eraser` with EU-specific handling.

### ⚙️ CI & GitHub Actions

- **[opentofu-updater-action](https://github.com/drumandbytes/opentofu-updater-action)** &nbsp;
  <img src="https://img.shields.io/github/v/tag/drumandbytes/opentofu-updater-action?style=flat-square&label=release" alt="Latest tag">
  <br>
  Keeps OpenTofu / Terraform providers, modules, Helm charts and container images current by
  opening pull requests.

- **[argocd-gitops-updater-action](https://github.com/drumandbytes/argocd-gitops-updater-action)** &nbsp;
  <img src="https://img.shields.io/github/v/tag/drumandbytes/argocd-gitops-updater-action?style=flat-square&label=release" alt="Latest tag">
  <br>
  Helm chart and image version bumps for GitOps repos. ArgoCD / Kustomize aware, with
  Slack / Teams / Discord / Telegram notifications.

- **[reusable-actions](https://github.com/drumandbytes/reusable-actions)**
  <br>
  Shared reusable workflows: Cloudflare Workers & Pages deploys, Node and Python CI, OpenTofu
  validation, Trivy scanning, and Dependabot auto-merge.

### 🏠 Homelab & self-hosting

- **[pve-metrics-exporter](https://github.com/drumandbytes/pve-metrics-exporter)** &nbsp;
  <img src="https://img.shields.io/github/stars/drumandbytes/pve-metrics-exporter?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/badge/ghcr.io-published-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Container image">
  <br>
  Proxmox VE exporter for Prometheus **and** Glance, including the CPU / GPU / NVMe hardware
  temperatures most Proxmox exporters skip.

- **[nordvpn](https://github.com/drumandbytes/nordvpn)** &nbsp;
  <img src="https://img.shields.io/badge/ghcr.io-published-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Container image">
  <br>
  Minimal, distroless NordVPN + Meshnet container image — no shell, no package manager —
  rebuilt weekly against the upstream `stable` channel.

- **[dotfiles](https://github.com/drumandbytes/dotfiles)**
  <br>
  macOS dotfiles managed with chezmoi — shell, Homebrew and app config, reproducible on a
  fresh machine.

## Tech & tools

<p>
  <img src="https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white" alt="Go">
  <img src="https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white" alt="TypeScript">
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python">
  <img src="https://img.shields.io/badge/OpenTofu-844FBA?style=flat-square&logo=opentofu&logoColor=white" alt="OpenTofu">
  <img src="https://img.shields.io/badge/Cloudflare-F38020?style=flat-square&logo=cloudflare&logoColor=white" alt="Cloudflare">
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white" alt="Kubernetes">
  <img src="https://img.shields.io/badge/Talos_Linux-FF7300?style=flat-square&logo=talos&logoColor=white" alt="Talos Linux">
  <img src="https://img.shields.io/badge/Argo_CD-EF7B4D?style=flat-square&logo=argo&logoColor=white" alt="Argo CD">
  <img src="https://img.shields.io/badge/Proxmox-E57000?style=flat-square&logo=proxmox&logoColor=white" alt="Proxmox">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/Preact-673AB8?style=flat-square&logo=preact&logoColor=white" alt="Preact">
  <img src="https://img.shields.io/badge/MapLibre-396CB2?style=flat-square&logo=maplibre&logoColor=white" alt="MapLibre">
</p>

## The person behind it

Built and maintained by **[@JustMaris](https://github.com/JustMaris)**.

<p>
  <img src="https://img.shields.io/github/followers/JustMaris?style=flat-square&label=followers" alt="GitHub followers">
  <img src="https://img.shields.io/badge/dynamic/json?style=flat-square&label=public%20repos&query=%24.public_repos&url=https%3A%2F%2Fapi.github.com%2Forgs%2Fdrumandbytes" alt="Public org repos">
</p>

---

<p align="center">
  <a href="mailto:contact@drumandbytes.com">contact@drumandbytes.com</a>
  &nbsp;·&nbsp;
  <a href="https://drumandbytes.com/">drumandbytes.com</a>
</p>
