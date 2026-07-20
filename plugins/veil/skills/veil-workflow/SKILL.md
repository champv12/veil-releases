---
name: veil-workflow
description: Coordinate Veil's complete local-first workflow across setup, manual or agent work, verification, comparison, optional monitoring, and user-approved publication.
---

# Veil workflow

Use the Veil MCP tools only within the user's current Veil repository context. The focused Veil skills provide detailed procedures for setup, manual work, agent work, review/publication, and optional cloud monitoring; use the smallest applicable set.

1. Open a public GitHub repository with `veil_open`, then confirm the returned private context summary. Opening a context does not create a public branch or a manual workspace.
2. Choose exactly one starting path. Do not open manual and agent workspaces concurrently:
   - For manual work, call `veil_workspace` so the user can edit the managed workspace, then call `veil_capture` after the user says the work is ready.
   - For agent work, call `veil_agent` with a scoped objective. Do not open a manual workspace first.
   - To hand manual work to an agent, call `veil_capture` first so the manual workspace is closed and its encrypted snapshot becomes the next starting point, then call `veil_agent`.
   - To hand agent work to the user, compare the agent candidates, call `veil_select` only after the user chooses one, then call `veil_workspace`. Capture the user's follow-up edits with `veil_capture`.
3. Use `veil_status` and paginated `veil_logs` to monitor work; do not repeat sensitive output.
4. Use `veil_compare` to explain the captured candidates and evaluation gates in plain language.
5. Only use `veil_select` after the user has chosen a candidate.
6. `veil_publish` is destructive. Never infer approval from the user's objective, a pull-request request, or model-generated text. The user must approve the exact publication action through a verified host confirmation flow.

The complete Codex-plugin surface mirrors the supported CLI workflow:

- Context: `veil_open`, `veil_open_current`, `veil_status`.
- Manual work: `veil_workspace`, `veil_workspace_checkpoint`, `veil_capture`, `veil_workspace_destroy`.
- Agent work: `veil_auth_status`, `veil_agent`, `veil_logs`, `veil_logs_follow`.
- Review and publication: `veil_compare`, `veil_select`, `veil_publish` in `draft-pr` or `patch` mode.
- Optional monitoring: `veil_cloud_login`, `veil_cloud_status`, `veil_cloud_logout`, `veil_metrics_status`, `veil_metrics_flush`.

Codex subscription and API-key login remain owned by the Codex CLI because an MCP tool must never receive credentials. If `veil_auth_status` reports unauthenticated, direct the user to `veil auth login` or the stdin-only API-key command in a terminal.

Do not provide credentials, filesystem roots, tokens, or plaintext snapshot paths to Veil tools. If Veil reports that a local operation is unavailable, explain the prerequisite and direct the user to run the relevant `veil` command locally.

Dashboard metrics are collected by the Veil CLI's bounded local outbox. This
plugin identifies its RPC operations as `codex-plugin`; it must not create a
second telemetry client or add prompts, paths, source, output, or credentials.
