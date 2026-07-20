class Veil < Formula
  desc "Private, local-first changes for public GitHub repositories"
  homepage "https://useveil.dev"
  url "https://registry.npmjs.org/@useveil-dev/cli/-/cli-0.2.0.tgz"
  version "0.2.0"
  sha256 "b648b58da1df8ee4e6754cb6afe0c41803cada6d4150d5258c70d9d38cdbe5fe"
  license :cannot_represent

  depends_on "git"
  depends_on "node"

  on_linux do
    depends_on "bubblewrap"
  end

  def install
    libexec.install Dir["*"]
    (bin/"veil").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/dist/veil.mjs" "$@"
    SH
  end

  test do
    output = shell_output("#{bin}/veil --help")
    assert_match "Usage:", output
    assert_match "veil open", output
  end
end
