class CheatSh < Formula
  desc "CLI client for cheat.sh, a community driven cheat sheet"
  homepage "https://cheat.sh/"
  url "https://github.com/chubin/cheat.sh/archive/571377f2f79422398a701cb1864487124ec3dcc6.tar.gz"
  version "unstable-2024-02-26"
  sha256 "e676f372045bc185c82ac58a0f66fe29d16013251e41ab847764e80d697b88c1"
  license "MIT"

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
