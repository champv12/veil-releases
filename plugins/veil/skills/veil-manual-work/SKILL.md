---
name: veil-manual-work
description: Guide hands-on editing in a Veil managed workspace, including encrypted checkpoints, final capture, safe handoff, and deliberate workspace destruction.
---

# Veil manual work

1. Call `veil_workspace` only after a context exists and no agent run owns the change. The returned managed workspace has no `.git` and is plaintext only while the user edits it.
2. Let the user edit in their chosen editor or terminal. Use `veil_workspace_checkpoint` for a durable encrypted checkpoint when useful; a checkpoint does not evaluate or destroy the workspace.
3. When the user says the work is ready, call `veil_capture`. Capture creates an immutable encrypted result, runs the pinned verification recipe when available (otherwise labels the result unchecked), and destroys the managed plaintext workspace after encrypted capture commits. It does not publish the result.
4. If the user wants an agent to continue manual work, capture first and then use the agent workflow.
5. Use `veil_workspace_destroy` only when the user explicitly wants to discard the current plaintext workspace. The host must obtain verified confirmation. Never treat an editing objective as permission to discard work.

If capture validation fails before encrypted capture commits, explain that the workspace remains available for correction. If evaluation fails after capture, the encrypted failed result and its gate evidence remain reviewable.
