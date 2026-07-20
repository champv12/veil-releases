---
name: veil-agent-work
description: Run and monitor one or two Codex candidates inside Veil, with safe authentication checks, bounded logs, cancellation-aware status, and manual handoff.
---

# Veil agent work

1. Call `veil_auth_status` before starting. If unauthenticated, direct the user to Codex-owned terminal login; never ask for a credential through a tool or prompt.
2. Ensure no manual workspace is open. If one is open, ask the user to capture it before agent work or explicitly destroy it through the confirmed manual-work flow.
3. Call `veil_agent` with a scoped objective. Use `agents: 1` by default; use `agents: 2` only when the user asks for alternatives or comparison. Pass a model only when the user chooses one.
4. Use `veil_status` for lifecycle state, `veil_logs` for one bounded redacted page, and `veil_logs_follow` when the user wants active monitoring until the run is terminal.
5. Explain that agent workspaces are independent, contain no `.git` or publication credentials, and are destroyed before candidate evaluation. Raw traces remain encrypted evidence rather than publication content.
6. After completion, use `veil_compare`. Do not select a result without the user's decision. To hand a chosen agent result to manual editing, call `veil_select` after the user chooses it, then `veil_workspace`.
