# frozen_string_literal: true

class KanoBetaDockerV4 < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-docker-v4/kano.tar.gz"
  version "0.0.0-de8ad28"
  sha256 "c1fc8d20b3b87f733642b7043129d8adb8e45f09f6888a3bb86049264f025231"
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
