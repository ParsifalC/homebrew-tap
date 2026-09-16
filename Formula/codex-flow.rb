class CodexFlow < Formula
  desc "Intelligent, Efficient, Adaptive Multi-Agent Strategy Orchestration for Codex"
  homepage "https://github.com/ParsifalC/codex-flow"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.14/codex-flow-2.1.14-darwin-arm64.tar.gz"
      sha256 "98ae753dba9f961fa40946e205d89b948343d871003048b314f4beca2ce4c15c"
    else
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.14/codex-flow-2.1.14-darwin-x86_64.tar.gz"
      sha256 "e1554847950b7a27eea69ac4fc903955db93cc8d59e6e5757a5a91f48ac5ce22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.14/codex-flow-2.1.14-linux-arm64.tar.gz"
      sha256 "b85466c4e1f9187ad1fac03622b268a087d167c8910cdc9625a0feb0b4029a03"
    else
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.14/codex-flow-2.1.14-linux-x86_64.tar.gz"
      sha256 "c20100b9b203888537545042d7e93b8ea403cfc3126b41f2cefac47442114c78"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/codex-flow"
    bin.write_exec_script libexec/"bin/codex-flow-mcp"
    completion = libexec/"completions/codex-flow.bash"
    bash_completion.install completion => "codex-flow" if completion.exist?
  end

  def caveats
    <<~EOS
      To initialize FlowPilot into your Codex environment, run:
        codex-flow install

      Or launch the interactive terminal console:
        codex-flow
    EOS
  end

  test do
    assert_match "codex-flow", shell_output("#{bin}/codex-flow --help")
  end
end
