class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"
  version "0.0.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "80abde7c4742b680a155cb7c3b80abcf859d556a55bc95f01ac6c754566a19e7"
  end

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/modular --version"
  end
end
