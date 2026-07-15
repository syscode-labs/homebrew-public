class Quickserve < Formula
  desc "Tiny HTTP directory server with LAN, UPnP, and Cloudflare Tunnel support"
  homepage "https://github.com/syscode-labs/quickserve"
  version "0.1.12"
  license "CC0-1.0"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.12/quickserve_v0.1.12_darwin_arm64.tar.gz"
      sha256 "71cd01613d8928e537314d51dbf173cf6066b24a9ddd76ab1eb91318d677f1f6"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.12/quickserve_v0.1.12_darwin_amd64.tar.gz"
      sha256 "95904eeeae9b16a40cf7d9e2f194a20ff02a2fd0ad3696703b46126d693aab36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.12/quickserve_v0.1.12_linux_arm64.tar.gz"
      sha256 "83081cf254c69d50031b68e6a1605f072b52edb975cfcf5d9520c593adb942dc"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.12/quickserve_v0.1.12_linux_amd64.tar.gz"
      sha256 "0132b6de5ad9bafa1aeaa7b00530fc580fb16c49480026b940b0ff4f8305c869"
    end
  end

  def install
    bin.install "quickserve"
  end

  test do
    assert_match "quickserve", shell_output("#{bin}/quickserve -version")
  end
end
