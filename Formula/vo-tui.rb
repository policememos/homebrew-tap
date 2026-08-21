class VoTui < Formula
  desc "Terminal UI for on-device live transcription and translation"
  homepage "https://github.com/policememos/vo-tui"
  url "https://github.com/policememos/vo-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1ff511634504214f773d668d32b75e84d72996ec359c4770b68d4dafc470f5e5"
  license "MIT"

  depends_on :macos
  depends_on "k1low/tap/vo"
  depends_on "python@3.14"

  def install
    bin.install "vo_tui.py" => "vo-tui"
    inreplace bin/"vo-tui", "#!/usr/bin/env python3",
      "#!#{formula_opt_bin("python@3.14")}/python3"
  end

  test do
    system bin/"vo-tui", "--help"
  end
end
