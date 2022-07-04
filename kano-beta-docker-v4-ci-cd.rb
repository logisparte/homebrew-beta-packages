# frozen_string_literal: true

class KanoBetaDockerV4CiCd < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-docker-v4-ci-cd/kano.tar.gz"
  version "0.0.0-a08bb95"
  sha256 "bc37a7904eca363d0f6e9d1362d28910b8db2e868bbd96e4c35a21c409c2140d"
  license "GPL-3.0-only"
  depends_on "git" => :optional

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  def caveats
    <<~EOF
      Homebrew formula does not support this syntax:
        depends_on cask: "docker" => :optional

      So to (optionally) install Docker Desktop, do:
        brew install --cask docker
    EOF
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
