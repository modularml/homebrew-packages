class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  if "#{ENV["HOMEBREW_MODULAR_URL"]}".empty?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/latest/modular-v0.8.0-macos-arm64.tar.gz"
    sha256 "13c125fda5429b6a555e55dca256666a59c396828adefc570c9565d177378eb3"
    version "0.8.0"
  else
    url "#{ENV["HOMEBREW_MODULAR_URL"]}"
    sha256 "#{ENV["HOMEBREW_MODULAR_SHA256"]}"
    version (/[[:digit:]].[[:digit:]].[[:digit:]]-rc[[:digit:]]/.match("#{ENV["HOMEBREW_MODULAR_URL"]}"))[0]
  end

  def install
    prefix.install Dir["*"]
    (etc/"modular").install_symlink Dir[prefix/"etc/modular/*"]
  end

  test do
    system "#{bin}/modular --version"
  end

  def caveats
    <<~EOS
      The Modular tool expects or will create a MODULAR_HOME directory.
      This defaults to `~/.modular`. You can create your own, and if you do,
      please add `MODULAR_HOME=/path/to/your/dir` to your environment.
    EOS
  end
end
