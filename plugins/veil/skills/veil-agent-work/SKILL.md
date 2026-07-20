---
name: veil-agent-work
description: Run and monitor Codex work inside Veil's private local-first workspace, with safe authentication checks, bounded logs, cancellation-aware status, and manual handoff.
---

# Veil agent work

1. Call `veil_codex_status` before starting. If unauthenticated, direct the user to `veil codex login` in a terminal; never ask for a credential through a tool or prompt.
2. Ensure no manual workspace is open. If one is open, ask the user to capture it before agent work or explicitly destroy it through the confirmed manual-work flow.
3. Call `veil_agent` with a scoped objective. Pass a model only when the user chooses one.
4. Use `veil_status` for lifecycle state, `veil_logs` for one bounded redacted page, and `veil_logs_follow` when the user wants active monitoring until the run is terminal.
5. Explain that the managed agent workspace contains no `.git` or publication credentials and is destroyed before the result is checked with its pinned recipe or labeled unchecked. Raw traces remain encrypted evidence rather than publication content.
6. After completion, use `veil_status` and `veil_logs` to explain the one current result and its verification status. To continue manually, call `veil_workspace`; later `veil_capture` replaces the current result after checks complete.
