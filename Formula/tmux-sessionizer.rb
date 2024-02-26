class TmuxSessionizer < Formula
  desc "Tool for opening git repositories as tmux sessions"
  homepage "https://github.com/jrmoulton/tmux-sessionizer"
  url "https://github.com/jrmoulton/tmux-sessionizer/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b65de2b9f4ad7cc78f8fb818bd31e2d2f54bee3b2078ca10c4d7f0a628d5dd0e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match("search paths", shell_output("#{bin}/tms config --help"))
    assert_match("tmux-sessionizer #{version}", shell_output("#{bin}/tms --version"))
  end
end
