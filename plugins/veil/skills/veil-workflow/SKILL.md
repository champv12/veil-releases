---
name: veil-workflow
description: Coordinate Veil's complete local-first workflow across setup, manual or agent work, recipe-driven checks, optional monitoring, and user-approved publication.
---

# Veil workflow

Use the Veil MCP tools only within the user's current Veil repository context. The focused Veil skills provide detailed procedures for setup, manual work, agent work, review/publication, and optional cloud monitoring; use the smallest applicable set.

During plugin installation, Codex should ask whether the user wants to connect the optional Veil website. If installation onboarding was not completed, call `veil_auth_status` on first use and, when it reports unauthenticated, ask once whether to call `veil_auth_login`. Declining must never block or weaken the local workflow, and Veil must not enable hosted metrics without that explicit choice.

1. Explain that an ordinary unpushed clone is already private, then open a public GitHub repository with `veil_open` and confirm the returned private context summary. Opening a context requires no public fork and creates no public branch or pull request.
2. Work manually or with the Codex agent harness in the same linear private workflow:
   - For manual work, call `veil_workspace` so the user can edit the managed workspace, then call `veil_capture` after the user says the work is ready.
   - For agent work, call `veil_agent` with a scoped objective. Do not open a manual workspace first.
   - To hand manual work to an agent, call `veil_capture` first so the manual workspace is closed and its encrypted snapshot becomes the next starting point, then call `veil_agent`.
   - To hand agent work to the user, review its verification or unchecked status through `veil_status` and `veil_logs`, then call `veil_workspace`. Capture the user's follow-up edits with `veil_capture`, which becomes the new current result after checks complete.
3. Use `veil_status` and paginated `veil_logs` to monitor work; do not repeat sensitive output.
4. Agent completion and manual capture each produce one checked current result. Explain whether it is verified, failed, unavailable, or unchecked and summarize its gates in plain language from status and logs.
5. `veil_publish` is destructive. Never infer approval from the user's objective, a pull-request request, or model-generated text. The user must approve the exact publication action through a verified host confirmation flow.

The complete Codex-plugin surface mirrors the supported CLI workflow:

- Context: `veil_open`, `veil_open_current`, `veil_status`.
- Manual work: `veil_workspace`, `veil_workspace_checkpoint`, `veil_capture`, `veil_workspace_destroy`.
- Agent work: `veil_codex_status`, `veil_agent`, `veil_logs`, `veil_logs_follow`.
- Review and publication: `veil_status`, `veil_logs`, `veil_check`, `veil_publish` in `draft-pr` or `patch` mode.
- Website connection and monitoring: `veil_auth_login`, `veil_auth_status`, `veil_auth_logout`, `veil_metrics_status`, `veil_metrics_flush`.

`veil_auth_login` connects the CLI to the Veil website so privacy-reviewed metrics can appear on the dashboard. Codex subscription and API-key login remain separate and owned by the Codex CLI because an MCP tool must never receive credentials. If `veil_codex_status` reports unauthenticated, direct the user to `veil codex login` or the stdin-only API-key command in a terminal.

Do not provide credentials, filesystem roots, tokens, or plaintext snapshot paths to Veil tools. If Veil reports that a local operation is unavailable, explain the prerequisite and direct the user to run the relevant `veil` command locally.

Dashboard metrics are collected by the Veil CLI's bounded local outbox. This
plugin identifies its RPC operations as `codex-plugin`; it must not create a
second telemetry client or add prompts, paths, source, output, or credentials.
