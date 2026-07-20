class Veil < Formula
  desc "Private, local-first changes for public GitHub repositories"
  homepage "https://useveil.dev"
  url "https://registry.npmjs.org/@useveil-dev/cli/-/cli-0.1.2.tgz"
  version "0.1.2"
  sha256 "fc7df12cb1b62fbeafc2731822fbf1e4266e07f58ed02d27d6fc8009d95a78b7"
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
