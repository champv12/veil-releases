---
name: veil-getting-started
description: Set up or open a Veil private context from a public GitHub repository or the current clean checkout, and diagnose Codex authentication prerequisites.
---

# Veil getting started

Use this skill when the user wants to start using Veil, open a repository, or diagnose setup.

At first-use onboarding, call `veil_auth_status`. If the optional website connection is not authenticated and the installer did not already ask, offer `veil_auth_login` once and explain that it uploads only privacy-reviewed operational metrics. Continue locally when the user declines.

1. Explain that an ordinary unpushed clone is already private. Veil adds encrypted durable state, a managed no-`.git` workspace, independent checks, and deliberate publication without requiring a public fork or intermediate public branch.
2. For a public GitHub URL, call `veil_open` with the canonical HTTPS URL and optional ref. For the current clean checkout, call `veil_open_current`; never invent or accept an arbitrary host path.
3. Summarize the immutable base commit, support checks, and returned private context. Opening a context creates no public branch or pull request.
4. Let the user work manually or with the Codex agent harness. Both update the same linear private result.
5. Before agent work, use `veil_codex_status`. If Codex is unavailable or signed out, ask the user to run `veil codex login` in a terminal. For API-key authentication, only mention `printenv OPENAI_API_KEY | veil codex login --api-key`; never request, accept, or repeat the key. `veil_auth_login` is instead the optional Veil website connection used to upload privacy-reviewed metrics.

Current alpha scope is macOS/Linux, public GitHub repositories, language-neutral repository admission, recipe-driven verification, and local Codex CLI. Veil detects common ecosystems or reads `veil.verify.json`; repositories without a runnable recipe remain usable but are explicitly labeled `unchecked`. macOS verification uses its built-in sandbox; Linux uses Bubblewrap; Docker is optional.
