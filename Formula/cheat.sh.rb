class CheatSh < Formula
  desc "CLI client for cheat.sh, a community driven cheat sheet"
  homepage "https://cheat.sh/"
  url "https://github.com/chubin/cheat.sh/archive/571377f2f79422398a701cb1864487124ec3dcc6.tar.gz"
  version "unstable-2024-02-26"
  sha256 "e676f372045bc185c82ac58a0f66fe29d16013251e41ab847764e80d697b88c1"
  license "MIT"

  bottle do
    root_url "https://github.com/Prioe/homebrew-personal/releases/download/cheat.sh-unstable-2024-02-26"
    sha256 cellar: :any_skip_relocation, ventura:      "7570f6a0e74731b8573dac1ba0c5d9ad014c0b683bd4a8a4957491658020d798"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8432de4eacc5c8e886c5f0f66013e758584c5843561e0a63a69eab1e3c70450b"
  end

  def install
    bin.install "share/cht.sh.txt" => "cht.sh"

    bash_completion.install "share/bash_completion.txt" => "cht.sh"
    zsh_completion.install "share/zsh.txt" => "_cht"
    fish_completion.install "share/fish.txt" => "cht.fish"
  end

  test do
    assert_match("you can simply issue a plain HTTP or HTTPS request", shell_output("#{bin}/cht.sh :intro"))
  end
end
