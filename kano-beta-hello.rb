# frozen_string_literal: true

class KanoBetaHello < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-hello/kano.tar.gz"
  version "0.0.0-a167e9a"
  sha256 "77b92c919e631793bcb139cf515e440ccca14a059b0b88d7723f722e7e998eae"
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
