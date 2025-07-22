class Bloom < Formula
  desc "Bloom new Rosé Pine themes"
  homepage "https://github.com/rose-pine/rose-pine-bloom"
  version "2.2.0"

  on_macos do
    on_intel do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v2.2.0/rose-pine-bloom-darwin-amd64"
      sha256 "78164c94d7fe268426162acb3edf42f7abdb655c69afeb44a60814aaf73f40f4"
    end

    on_arm do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v2.2.0/rose-pine-bloom-darwin-arm64"
      sha256 "86191ff3a558618da7a8e33f3cd942157a319089900e2fd455bbc5d061d0a621"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v2.2.0/rose-pine-bloom-linux-amd64"
      sha256 "71de2f9e5effec82be41e2d7bd043e7ffcb661fe0c66c2b79a5cc457eddfb5e8"
    end

    on_arm do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v2.2.0/rose-pine-bloom-linux-arm64"
      sha256 "0b639413ef77ebafa9a73bca0e1b12240b8b8658a943835dd2f4272f2664e484"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.intel? ? "rose-pine-bloom-darwin-amd64" : "rose-pine-bloom-darwin-arm64"
    else
      Hardware::CPU.intel? ? "rose-pine-bloom-linux-amd64" : "rose-pine-bloom-linux-arm64"
    end

    chmod(0755, binary_name)
    bin.install(binary_name => "bloom")
  end

  test do
    system "#{bin}/bloom", "--version"
  end
end
