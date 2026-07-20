# Veil Codex plugin

The Veil plugin exposes the supported local CLI workflow through the bundled
stdio MCP server. Install the matching `@useveil-dev/cli` version first; the plugin
contains no daemon, cloud token, Codex credential, or second execution engine.

An ordinary local clone already keeps unpushed work private. Veil adds an
encrypted, managed workspace and independent checks, and keeps the result out
of public Git refs until the user explicitly publishes it. A public fork is not
required to begin. Creating a draft pull request still requires repository
access; patch export is available for a normal maintainer handoff.

## Tools

- Context: `veil_open`, `veil_open_current`, `veil_status`
- Manual work: `veil_workspace`, `veil_workspace_checkpoint`, `veil_capture`,
  `veil_workspace_destroy`
- Agent work: `veil_codex_status`, `veil_agent`, `veil_logs`, `veil_logs_follow`
- Publication: `veil_publish` with `draft-pr` or `patch` mode
- Website connection and monitoring: `veil_auth_login`, `veil_auth_status`,
  `veil_auth_logout`, `veil_metrics_status`, `veil_metrics_flush`

Workspace destruction, cloud logout, and publication fail closed unless the
MCP host supports verified user elicitation. Publication confirmation is bound
to the short-lived current verified result, mode, patch hash, branch when applicable, and
expiry.

`veil auth` connects the CLI to the Veil website so privacy-reviewed metrics can
appear on the dashboard. Codex subscription and API-key login remain separate,
terminal-owned actions. The plugin can report Codex status but never accepts
Codex credentials; use `veil codex login` or pipe a key to
`veil codex login --api-key` locally.

## Skills

The package includes an umbrella workflow skill plus focused guidance for
getting started, manual work, agent work, review/publication, and optional
cloud monitoring. Manual and agent-assisted work follow the same linear
capture, automatic verification, and publication path. All skills use the same
encrypted local state and command-scoped CLI operations as the terminal and VS
Code surfaces.
