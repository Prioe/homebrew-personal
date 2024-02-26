class TmuxSessionizer < Formula
  desc "Tool for opening git repositories as tmux sessions"
  homepage "https://github.com/jrmoulton/tmux-sessionizer"
  url "https://github.com/jrmoulton/tmux-sessionizer/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b65de2b9f4ad7cc78f8fb818bd31e2d2f54bee3b2078ca10c4d7f0a628d5dd0e"
  license "MIT"

  bottle do
    root_url "https://github.com/Prioe/homebrew-personal/releases/download/tmux-sessionizer-0.4.0"
    sha256 cellar: :any,                 ventura:      "1edbb836922bffd2f58e9d068b2e7e76ff7315935e75da24cf6970ed6fb594d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b2142fe5fbe33e33bd2fb21c032bd2ee18ea6ddb19471c40c91cfb85a1d138a"
  end

  depends_on "rust" => :build
  depends_on "libgit2"

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "openssl@3"
  end

  def install
    # Ensure that the `openssl` crate picks up the intended library.
    ENV["OPENSSL_DIR"] = Formula["openssl@3"].opt_prefix
    ENV["OPENSSL_NO_VENDOR"] = "1"

    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match("search paths", shell_output("#{bin}/tms config --help"))
    assert_match("tmux-sessionizer #{version}", shell_output("#{bin}/tms --version"))
  end
end
