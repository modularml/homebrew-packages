class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"
  version "0.0.1"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  option "with-testrepo"

  if build.with? "testrepo"
    url "https://dl.modular.com/ksFEA5DYuqJJ84kb/installer-test/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "320ca46f7478163e46e03cdcf72b44b53a55ad25d271d4c688af89dff34a37cb"
  else
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "80abde7c4742b680a155cb7c3b80abcf859d556a55bc95f01ac6c754566a19e7"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/modular --version"
  end
end
