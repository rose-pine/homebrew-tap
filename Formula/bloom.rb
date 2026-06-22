class Bloom < Formula
  desc "Generate Rosé Pine themes"
  homepage "https://github.com/rose-pine/rose-pine-bloom"
  url "https://github.com/rose-pine/rose-pine-bloom/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "9bf63c1aa95375542c8292fa6149ff4dda1dcefdae8ab6589f764c99c0164788"
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
