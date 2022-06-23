# frozen_string_literal: true

class KanoBetaHello < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-hello/kano.tar.gz"
  version "0.0.0-e4710f1"
  sha256 "13d7815f899e6c2f4d76afc0364fe30a9d83d3a92e44a6f2c293298b550b72ce"
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
