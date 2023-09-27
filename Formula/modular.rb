class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"
  version "0.0.1"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  if "#{ENV["HOMEBREW_MODULAR_URL_SLUG"]}".empty?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "80abde7c4742b680a155cb7c3b80abcf859d556a55bc95f01ac6c754566a19e7"
  else
    url "https://dl.modular.com/#{ENV["HOMEBREW_MODULAR_URL_SLUG"]}/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "#{ENV["HOMEBREW_MODULAR_SHA256"]}"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/modular --version"
  end
end
