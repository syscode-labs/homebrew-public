class Quickserve < Formula
  desc "Tiny HTTP directory server with LAN, UPnP, and Cloudflare Tunnel support"
  homepage "https://github.com/syscode-labs/quickserve"
  version "0.1.11"
  license "CC0-1.0"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.11/quickserve_v0.1.11_darwin_arm64.tar.gz"
      sha256 "4ce334440ae53d7005b207b7a7bad004d9eb0f812d0ed7ace54c16bce6dcbefa"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.11/quickserve_v0.1.11_darwin_amd64.tar.gz"
      sha256 "6ecc1846c1060cf94ca60bfb9a802a761fb172b61b2b4b13785930c53d19e480"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.11/quickserve_v0.1.11_linux_arm64.tar.gz"
      sha256 "b05d6446dc9c3d59ca5b1f5279f1cd4398b4f4ee1f30e16d75f0855a08988253"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.11/quickserve_v0.1.11_linux_amd64.tar.gz"
      sha256 "bb39ff6c4170e8137b0f8a3c57328b81c260f7da30f0a6464b5b78c967d5a519"
    end
  end

  def install
    bin.install "quickserve"
  end

  test do
    assert_match "quickserve", shell_output("#{bin}/quickserve -version")
  end
end
