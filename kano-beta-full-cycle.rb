# frozen_string_literal: true

class KanoBetaFullCycle < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-full-cycle/kano.tar.gz"
  version "0.0.0-10618e4"
  sha256 "8282f97ec63648fef07076e7e9ed474123d925eb86889fefa8d6961b9d3542f8"
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
