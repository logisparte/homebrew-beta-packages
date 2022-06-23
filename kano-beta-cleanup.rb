# frozen_string_literal: true

class KanoBetaCleanup < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/beta-cleanup/kano.tar.gz"
  version "0.0.0-9fa0022"
  sha256 "36e91ae53c06fd0c3e89957e87cd6782ccf22c32a9e10cee56436a455dfda7b4"
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
