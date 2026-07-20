---
name: veil-getting-started
description: Set up or open a Veil private context from a public GitHub repository or the current clean checkout, and diagnose Codex authentication prerequisites.
---

# Veil getting started

Use this skill when the user wants to start using Veil, open a repository, or diagnose setup.

1. Explain that an ordinary unpushed clone is already private. Veil adds encrypted candidates, managed no-`.git` workspaces, independent verification, comparison, and selective publication.
2. For a public GitHub URL, call `veil_open` with the canonical HTTPS URL and optional ref. For the current clean checkout, call `veil_open_current`; never invent or accept an arbitrary host path.
3. Summarize the immutable base commit, support checks, and returned private context. Opening a context creates no public branch or pull request.
4. Let the user choose manual work or agent work. Do not open both starting workspaces concurrently.
5. Before agent work, use `veil_auth_status`. If Codex is unavailable or signed out, ask the user to run `veil auth login` in a terminal. For API-key authentication, only mention `printenv OPENAI_API_KEY | veil auth login --api-key`; never request, accept, or repeat the key.

Current alpha scope is macOS/Linux, public GitHub repositories, Node/npm with `package-lock.json`, and local Codex CLI. macOS verification uses its built-in sandbox; Linux uses Bubblewrap; Docker is optional.
