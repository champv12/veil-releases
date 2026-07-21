class Veil < Formula
  desc "Private, local-first changes for public GitHub repositories"
  homepage "https://useveil.dev"
  url "https://registry.npmjs.org/@useveil-dev/cli/-/cli-0.2.1.tgz"
  version "0.2.1"
  sha256 "40948524acb40225e33357248c9f43e9b15a4acd8b6077df1c4e2b56f8dd2df9"
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
