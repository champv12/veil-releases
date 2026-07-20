---
name: veil-cloud-monitoring
description: Manage Veil website authentication and privacy-reviewed operational metrics without confusing monitoring with local execution or Codex authentication.
---

# Veil optional cloud monitoring

The hosted dashboard is optional observability. It never owns, decrypts, or executes normal local Veil work.

1. Use `veil_auth_login` when the user asks to authenticate the CLI with the Veil website so metrics can appear on the dashboard. It uses device authorization and the operating-system credential store; never request or expose its tokens.
2. Use `veil_auth_status` to check the website session. Use `veil_auth_logout` only after verified host confirmation because it removes the stored session from this device.
3. Use `veil_metrics_status` to summarize the bounded local outbox. Explain that events contain only allowlisted operation, outcome, duration, and trusted surface fields—not source, prompts, paths, repository names, model output, or credentials.
4. Use `veil_metrics_flush` only when the user asks to deliver queued evidence. Authentication, network, or server failures leave unacknowledged events in the outbox.

Do not confuse website authentication with Codex authentication. The website connection is optional for local work, verification, and publication; use `veil_codex_status` when checking whether Codex can run.
