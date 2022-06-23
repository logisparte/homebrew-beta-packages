# frozen_string_literal: true

class KanoBetaHello < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-hello/kano.tar.gz"
  version "0.0.0-0e5e540"
  sha256 "9cc6fc7a324b9d9ea217785e0b26e978bd287c64600580ff19904542a8debb6e"
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
