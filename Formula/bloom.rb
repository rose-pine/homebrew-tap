class Bloom < Formula
  desc "Generate Rosé Pine themes"
  homepage "https://github.com/rose-pine/rose-pine-bloom"
  head "https://github.com/rose-pine/rose-pine-bloom.git", branch: "main"
  version "3.0.1"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v3.0.1/rose-pine-bloom-darwin-amd64"
      sha256 "a7c4bc0606abaf67ae7f2fd161349c51a8f5559d43dba54b7bf2081261bec959"
    end

    on_arm do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v3.0.1/rose-pine-bloom-darwin-arm64"
      sha256 "2ec41950b22082d43edcd6b696d2e08a1d574645fcf7da65369dd6e01eddfd5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v3.0.1/rose-pine-bloom-linux-amd64"
      sha256 "0d5c5a4bf6e3220e7eeff81bad1929ac40666e123984a05c3945f07a3bd37ec2"
    end

    on_arm do
      url "https://github.com/rose-pine/rose-pine-bloom/releases/download/v3.0.1/rose-pine-bloom-linux-arm64"
      sha256 "fc44ae9396e08ace6c3c94d6e4a2228e1bae64d308fbe287e72057b4d0ca5c42"
    end
  end

  def install
    if build.head?
      commit = Utils.safe_popen_read("git", "rev-parse", "--short", "HEAD").chomp
      ldflags = "-s -w -X github.com/rose-pine/rose-pine-bloom/cmd.version=HEAD-#{commit}"
      system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"bloom"), "."
    else
      binary_name = if OS.mac?
        Hardware::CPU.intel? ? "rose-pine-bloom-darwin-amd64" : "rose-pine-bloom-darwin-arm64"
      else
        Hardware::CPU.intel? ? "rose-pine-bloom-linux-amd64" : "rose-pine-bloom-linux-arm64"
      end

      chmod(0755, binary_name)
      bin.install(binary_name => "bloom")
    end
  end

  test do
    system "#{bin}/bloom", "--version"
  end
end
