# Veil Codex plugin

The Veil plugin exposes the supported local CLI workflow through the bundled
stdio MCP server. Install the matching `@useveil-dev/cli` version first; the plugin
contains no daemon, cloud token, Codex credential, or second execution engine.

## Tools

- Context: `veil_open`, `veil_open_current`, `veil_status`
- Manual work: `veil_workspace`, `veil_workspace_checkpoint`, `veil_capture`,
  `veil_workspace_destroy`
- Agent work: `veil_auth_status`, `veil_agent`, `veil_logs`, `veil_logs_follow`
- Review: `veil_compare`, `veil_select`
- Publication: `veil_publish` with `draft-pr` or `patch` mode
- Optional monitoring: `veil_cloud_login`, `veil_cloud_status`,
  `veil_cloud_logout`, `veil_metrics_status`, `veil_metrics_flush`

Workspace destruction, cloud logout, and publication fail closed unless the
MCP host supports verified user elicitation. Publication confirmation is bound
to a short-lived candidate, mode, patch hash, branch when applicable, and
expiry.

Codex subscription and API-key login remain terminal-owned actions. The plugin
can report authentication status but never accepts credentials; use
`veil auth login` or pipe a key to `veil auth login --api-key` locally.

## Skills

The package includes an umbrella workflow skill plus focused guidance for
getting started, manual work, agent work, review/publication, and optional cloud
monitoring. All skills use the same encrypted local state and command-scoped
CLI operations as the terminal and VS Code surfaces.
