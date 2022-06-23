# frozen_string_literal: true

class KanoBetaCleanup < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-cleanup/kano.tar.gz"
  version "0.0.0-962e18d"
  sha256 "17f1f6a3a2007675499956dea3ebf83b92d5d20d18a47aa5a21027dd7daafc7c"
  license "GPL-3.0-only"
  depends_on "docker" => :optional
  depends_on "git" => :optional

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
