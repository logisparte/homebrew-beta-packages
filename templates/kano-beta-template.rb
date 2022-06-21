# frozen_string_literal: true

class KanoBeta < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "{URL}"
  sha256 "{SHA256}"
  license "GPL-3.0-only"
  depends_on "docker" => :optional
  depends_on "git" => :optional

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano-beta-{NAME}")
  end

  test do
    help_output = shell_output("kano-beta-{NAME} help")
    assert_match(/Show this help message/, help_output)
  end
end
