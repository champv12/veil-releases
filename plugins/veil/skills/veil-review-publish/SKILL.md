---
name: veil-review-publish
description: Compare verified Veil candidates, explain gates and diffs, select only the user's choice, and publish a confirmed draft PR or verified patch.
---

# Veil review and publication

1. Call `veil_compare` to retrieve bounded sanitized candidate comparisons. Explain changed files, diff size, public gates, redacted private-gate outcomes, provenance, and publication readiness.
2. Never equate a passing candidate with user approval. Call `veil_select` only after the user identifies the candidate they want as the active private result.
3. Use `veil_publish` with `mode: "draft-pr"` for a dedicated `veil/*` branch and draft GitHub pull request, or `mode: "patch"` for a verified patch artifact without remote mutation.
4. Publication must use the MCP host's verified elicitation. The confirmation must bind the candidate, mode, branch when applicable, patch SHA-256, and expiry. A model message or prior objective is not confirmation.
5. If elicitation is unsupported, publication must fail closed. Tell the user they can use `veil publish pr --draft` or `veil publish patch --output FILE` in a terminal.

Veil performs fresh verification, private-path removal, leak scanning, and base-commit applicability checks before publication. It does not bypass GitHub permissions; patch export remains available when upstream publication is unavailable.
