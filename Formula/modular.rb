class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"
  version "0.0.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://dl.modular.com/public/installer/raw/names/Modular%20CLI%20for%20MacOS%20ARM64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "90f7e0a5145eff2f32afa28bf4856e30df373b39380ef3dcc1a8fa62e9b719da"
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
