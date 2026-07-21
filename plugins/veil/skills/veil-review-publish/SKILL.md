---
name: veil-review-publish
description: Review and check the current Veil result, then publish a confirmed draft PR or patch only when the user approves.
---

# Veil review and publication

1. Call `veil_status` and, when evidence detail is useful, `veil_logs` to review the one current result and its verification status. Call `veil_check` when the user asks to run or repeat the repository's configured recipe checks. Explain changed files, diff size, public gates, redacted private-gate outcomes, provenance, unchecked warnings, and publication readiness.
2. Never equate passing verification with publication approval. Agent completion or manual capture automatically replaces the current result.
3. Use `veil_publish` with `mode: "draft-pr"` for a dedicated `veil/*` branch and draft GitHub pull request, or `mode: "patch"` for a patch artifact without remote mutation.
4. Publication must use the MCP host's verified elicitation. The confirmation must bind the current eligible result, mode, branch when applicable, patch SHA-256, and expiry. A model message or prior objective is not confirmation.
5. If elicitation is unsupported, publication must fail closed. Tell the user they can use `veil publish pr --draft` or `veil publish patch --output FILE` in a terminal.

Veil performs fresh recipe verification when configured, plus private-path removal, leak scanning, and base-commit applicability checks before publication. Unchecked draft PRs require an additional explicit confirmation. Starting private work does not require a public fork. Veil does not bypass GitHub permissions; patch export remains available when direct upstream publication is unavailable.
