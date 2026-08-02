class Bpm < Formula
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm_v0.2.1_darwin_arm64.tar.gz"
      sha256 "e782230901dce78a6de846614d824442c0af75f41bc1037a17015dfaf0adecda"

      resource "bpm-tray" do
        url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm-tray_v0.2.1_darwin_arm64.tar.gz"
        sha256 "3a9dad32c81904e539bc9083d3fa59c739fac2eea15246ef453b1451fa31f1da"
      end
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm_v0.2.1_darwin_amd64.tar.gz"
      sha256 "dabf269b05f8f22da20ef2d6ebea4965cdd7f719a581e9b14dbb2bafb6ed93dc"

      resource "bpm-tray" do
        url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm-tray_v0.2.1_darwin_amd64.tar.gz"
        sha256 "0729812060466ed86d12519fedfee9c18a7c6579a5eff3e284065f076f3de756"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm_v0.2.1_linux_arm64.tar.gz"
      sha256 "2ea9bc14de607807f25b3283c7bc45baa5253911085b985c6f8c9e78401aba18"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.2.1/bpm_v0.2.1_linux_amd64.tar.gz"
      sha256 "e9932c57b9fa9542c5210fd94b0784c5f99cda3e4361df3936314f666aa7370b"
    end
  end

  def install
    bin.install "bpm"

    # bpm-tray (the macOS menu bar app) only ships for macOS - it needs
    # Cocoa via cgo, there's nothing to build or run on Linux.
    if OS.mac?
      resource("bpm-tray").stage do
        bin.install "bpm-tray"
      end
    end
  end

  test do
    output = shell_output("#{bin}/bpm 2>&1", 2)
    assert_match "bpm — Bambu Studio profile manager", output
    assert_predicate bin/"bpm-tray", :exist? if OS.mac?
  end
end
