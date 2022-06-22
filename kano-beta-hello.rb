# frozen_string_literal: true

class KanoBetaHello < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-hello/kano.tar.gz"
  version "beta-hello"
  sha256 "398031704c4165d54944a5415d692d95b69a18c2fef64ac3d4abd4ff7ffce6c2"
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
