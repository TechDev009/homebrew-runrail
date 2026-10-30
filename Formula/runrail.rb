# Written by Runrail's publish workflow for each release; edits here are replaced.
class Runrail < Formula
  desc "Local-first, verification-first harness for coding agents"
  homepage "https://github.com/TechDev009/runrail"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/TechDev009/runrail/releases/download/v0.2.0/runrail-0.2.0-darwin-arm64.tar.gz"
      sha256 "1f7f735488e892c8f029ac09e8a30cab73a44856c8cc7a06affa10d5af713c36"
    end
    on_intel do
      url "https://github.com/TechDev009/runrail/releases/download/v0.2.0/runrail-0.2.0-darwin-x64.tar.gz"
      sha256 "afc6ef24241476982cb7fad61a19d2f41f42ead07eb7323d40f53e1a14d4645f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TechDev009/runrail/releases/download/v0.2.0/runrail-0.2.0-linux-arm64.tar.gz"
      sha256 "e5456fffcf45471003e63eeb8ba23151d7e98e6ee2c33840267dc99ea6465b3b"
    end
    on_intel do
      url "https://github.com/TechDev009/runrail/releases/download/v0.2.0/runrail-0.2.0-linux-x64.tar.gz"
      sha256 "b88242c343a188017a5a9dcb660a4a44778273918da91274502f53d8597c29ec"
    end
  end

  def install
    bin.install "runrail"
  end

  def caveats
    <<~EOS
      For Claude Code to ask before it uses a tool, Runrail needs Anthropic's Claude Agent SDK.
      This downloads it from npm, after asking you:
        runrail sdk install
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/runrail --version").strip
  end
end
