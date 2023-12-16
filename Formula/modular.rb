class Modular < Formula
  desc "Modular developer CLI tool"
  homepage "https://www.modular.com"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.11"

  if "#{ENV["HOMEBREW_MODULAR_URL"]}".empty?
    url "https://dl.modular.com/public/installer/raw/names/modular-mac-arm64/versions/latest/modular-v0.3.1-macos-arm64.tar.gz"
    sha256 "7b16c9fa7c393e261afa0eee4b73d5b5fcee795e491a44ad60cffd69e2ead572"
    version "0.3.1"
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
