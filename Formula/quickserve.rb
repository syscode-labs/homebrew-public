class Quickserve < Formula
  desc "Tiny HTTP directory server with LAN, UPnP, and Cloudflare Tunnel support"
  homepage "https://github.com/syscode-labs/quickserve"
  version "0.1.13"
  license "CC0-1.0"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.13/quickserve_v0.1.13_darwin_arm64.tar.gz"
      sha256 "d51a76ca5f24c7ce0520b48fa3e9b9baed4defda0df32f972efed8555277c628"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.13/quickserve_v0.1.13_darwin_amd64.tar.gz"
      sha256 "53d25f54adbffb23679234191882cd27db68db905ec85f11fd5e86f73932a41d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.13/quickserve_v0.1.13_linux_arm64.tar.gz"
      sha256 "ad946bb6d264edbfe68ab2cf7e322fa7024a83bfe08ef22a084b0f9a81f6e331"
    end

    on_intel do
      url "https://github.com/syscode-labs/quickserve/releases/download/v0.1.13/quickserve_v0.1.13_linux_amd64.tar.gz"
      sha256 "e7059ffb17698bb493a84f2fbc3bdc808d2497f775182b5953991df0c0588d71"
    end
  end

  def install
    bin.install "quickserve"
  end

  test do
    assert_match "quickserve", shell_output("#{bin}/quickserve -version")
  end
end
