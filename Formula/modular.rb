class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  if "#{ENV["HOMEBREW_MODULAR_URL"]}".empty?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/latest/modular-v0.9.3-macos-arm64.tar.gz"
    sha256 "988c3b796e767682dfacce0e7f7b751c2c07ac9eef0b0233ddbf8bce43c7872e"
    version "0.9.3"
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
