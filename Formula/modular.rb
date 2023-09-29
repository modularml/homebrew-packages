class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"
  version "0.2.0"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  if "#{ENV["HOMEBREW_MODULAR_URL_SLUG"]}".empty?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "726358aaefbbf9ae9ea820e36822a19080c7fac1b32dcdc2731a28822ca52a5d"
  else
    url "https://dl.modular.com/#{ENV["HOMEBREW_MODULAR_URL_SLUG"]}/raw/names/modular-mac-arm64/versions/0.0.1/modular-0.0.1-macos-arm64.tar.gz"
    sha256 "#{ENV["HOMEBREW_MODULAR_SHA256"]}"
  end

  def install
    prefix.install Dir["*"]
    (etc/"modular").install_symlink Dir[prefix/"etc/modular/*"]
  end

  test do
    system "#{bin}/modular --version"
  end
end
