# Veil distribution

This is Veil's only public distribution repository. It has three jobs:

1. Host checksummed CLI, VSIX, Codex plugin, Homebrew, and Debian downloads in [GitHub Releases](https://github.com/champv12/veil-releases/releases).
2. Serve the Homebrew formula in [`Formula/veil.rb`](Formula/veil.rb).
3. Serve the installable Codex marketplace in [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json) and [`plugins/veil`](plugins/veil).

Veil's proprietary source code, build workflow, and private verification artifacts live in a separate private repository. Public packages and downloads from this repository are distributions of proprietary software; they do not make the source open source. See the license included with each client.

## Install the CLI

```bash
# Recommended on macOS or Linux
curl -fsSL https://useveil.dev/install | sh

# Homebrew on macOS or Linux
brew install champv12/veil/veil

# npm
npm install --global @useveil-dev/cli
```

Versioned Debian packages for x64 and ARM64 are available from the [latest release](https://github.com/champv12/veil-releases/releases/latest). Docker is not required. Linux verification uses Bubblewrap; macOS uses its built-in sandbox.

## Install the Codex plugin

```bash
codex plugin marketplace add champv12/veil-releases --ref main
codex plugin add veil@veil
```

The plugin includes all six Veil skills and configures `veil mcp serve`; there is no separate MCP repository or download. Install the matching Veil CLI first.

## Verify downloads

Every release includes `manifest.json` and `SHA256SUMS`. The manifest records each artifact's filename, kind, byte length, and SHA-256 digest. `install.sh` verifies the CLI archive and Node.js runtime before installing under `~/.local`.

Product documentation and tailored download options are at [useveil.dev/start](https://useveil.dev/start) and [useveil.dev/downloads](https://useveil.dev/downloads).
