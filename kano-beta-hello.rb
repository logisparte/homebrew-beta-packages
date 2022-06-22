# frozen_string_literal: true

class KanoBetaHello < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-hello/kano.tar.gz"
  version "caeaa99"
  sha256 "b9fbd9f12a1d11684016c9764f09b0b1ccce40a15d239ca0f9fba2a85ba17bb8"
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
