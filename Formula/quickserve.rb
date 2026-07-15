class Quickserve < Formula
  desc "Tiny HTTP directory server with LAN, UPnP, and Cloudflare Tunnel support"
  homepage "https://github.com/syscode-labs/quickserve"
  version "0.1.10"
  license "CC0-1.0"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.10/quickserve_v0.1.10_darwin_arm64.tar.gz"
      sha256 "2ca2825062b5105108d8e7fb2b1d0c87c010d4f26723189b69536430862f7798"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.10/quickserve_v0.1.10_darwin_amd64.tar.gz"
      sha256 "4bf5ca43c86fcffd0b82359474486ceb4e2a0b00a73983342177f96bb1f69a40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.10/quickserve_v0.1.10_linux_arm64.tar.gz"
      sha256 "795933093ea409c334a0684d0a88b798e6340acb8b2c69273034c5dfcae89013"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.10/quickserve_v0.1.10_linux_amd64.tar.gz"
      sha256 "4f8ce39c93657a5c9f939e23c1b8e457dfd7df9badeda26e175b3e095aedc0f7"
    end
  end

  def install
    bin.install "quickserve"
  end

  test do
    assert_match "quickserve", shell_output("#{bin}/quickserve -version")
  end
end
