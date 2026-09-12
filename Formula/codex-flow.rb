class CodexFlow < Formula
  desc "Intelligent, Efficient, Adaptive Multi-Agent Strategy Orchestration for Codex"
  homepage "https://github.com/ParsifalC/codex-flow"
  version "2.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.12/codex-flow-2.1.12-darwin-arm64.tar.gz"
      sha256 "c889c8ca71d5dfbc0997ee8ea9052688801193dc0814119b51f4aa0f085862ba"
    else
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.12/codex-flow-2.1.12-darwin-x86_64.tar.gz"
      sha256 "9e283b10451a58461fb31a0b119ae771484474a5e120f5ea6cb428f7331bc62c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.12/codex-flow-2.1.12-linux-arm64.tar.gz"
      sha256 "1760c17aada31a90cdbd94dd27fd3a91739c3ff74010594a0d06212042aea3c1"
    else
      url "https://github.com/ParsifalC/codex-flow/releases/download/v2.1.12/codex-flow-2.1.12-linux-x86_64.tar.gz"
      sha256 "93ce8d39eed7cb8482dff02e04f512f93468cdf8c81b744e835d055db439d88f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/codex-flow"
    bin.write_exec_script libexec/"bin/codex-flow-mcp"
    bash_completion.install libexec/"completions/codex-flow.bash" => "codex-flow" if (libexec/"completions/codex-flow.bash").exist?
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
    assert_match "codex-flow", shell_output("#{bin}/codex-flow --help", 0)
  end
end
