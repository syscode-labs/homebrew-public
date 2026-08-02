class Bpm < Formula
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.1.0/bpm_v0.1.0_darwin_arm64.tar.gz"
      sha256 "15e88585340ef45d253145f2966071fce7d1f6dde8f7df6d6575b692672d7389"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.1.0/bpm_v0.1.0_darwin_amd64.tar.gz"
      sha256 "94b837354bf6139f093d710332736b56cd1f1aade16ef2513fea8b64bcdb62b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.1.0/bpm_v0.1.0_linux_arm64.tar.gz"
      sha256 "ee3fd36ade4daf0cc1a4013d3cfc07417f78cf7910755116d80701eef9bdcb07"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.1.0/bpm_v0.1.0_linux_amd64.tar.gz"
      sha256 "064bd97353ff1cb3c23ae609c0681aea7844dfe5c1d88b12d0840eddb0cb5c24"
    end
  end

  def install
    bin.install "bpm"
  end

  test do
    output = shell_output("#{bin}/bpm 2>&1", 2)
    assert_match "bpm — Bambu Studio profile manager", output
  end
end
