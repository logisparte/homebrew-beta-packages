# frozen_string_literal: true

class KanoBetaFullCycle < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-full-cycle/kano.tar.gz"
  version "0.0.0-65729ab"
  sha256 "516d37cb374db5b2b89b0b821a86ff20cb37e474b193aac4d930f3828babf65c"
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
