---
name: veil-cloud-monitoring
description: Manage Veil's optional hosted-dashboard connection and privacy-reviewed operational metrics without confusing monitoring with local execution.
---

# Veil optional cloud monitoring

The hosted dashboard is optional observability. It never owns, decrypts, or executes normal local Veil work.

1. Use `veil_cloud_login` only when the user asks to connect monitoring. It uses device authorization and the operating-system credential store; never request or expose its tokens.
2. Use `veil_cloud_status` to check the session. Use `veil_cloud_logout` only after verified host confirmation because it removes the stored session from this device.
3. Use `veil_metrics_status` to summarize the bounded local outbox. Explain that events contain only allowlisted operation, outcome, duration, and trusted surface fields—not source, prompts, paths, repository names, model output, or credentials.
4. Use `veil_metrics_flush` only when the user asks to deliver queued evidence. Authentication, network, or server failures leave unacknowledged events in the outbox.

Do not describe cloud login as required for the CLI, Codex plugin, VS Code extension, verification, or publication.
