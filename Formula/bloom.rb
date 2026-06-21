class Bloom < Formula
  desc "Generate Rosé Pine themes"
  homepage "https://github.com/rose-pine/rose-pine-bloom"
  url "https://github.com/rose-pine/rose-pine-bloom/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "3e998e424adedc155b080153e4225e0b9c429a4ac76946396f85f26c3aacaf46"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/rose-pine/rose-pine-bloom/cmd.version=#{version}", output: bin/"bloom"), "."
    generate_completions_from_executable(bin/"bloom", "completion")
  end

  test do
    assert_match "bloom", shell_output("#{bin}/bloom --help")
  end
end
