class Picoflow < Formula
  desc "Lightweight DAG workflow orchestrator for edge devices"
  homepage "https://github.com/zoza1982/picoflow"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.0/picoflow-v0.1.0-darwin-arm64-macos.tar.gz"
      sha256 "5fa096b16929decd1280d942018c1a3f0c32743cdbb8c7d7e272575c15784ac7"
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.0/picoflow-v0.1.0-darwin-x86_64-macos.tar.gz"
      sha256 "13e9d1ad981acef91993eed306e789ee4c2dc5f8a1229968edb4cb5988b4f5dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.0/picoflow-v0.1.0-arm64-linux.tar.gz"
        sha256 "eed9a9402f254f4f64b638133eadbfbf83afd02666f66b1e91d7a1f1e898a6c2"
      else
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.0/picoflow-v0.1.0-arm32-linux.tar.gz"
        sha256 "54783f4d2e53e75bdcbca7605976bd83b23bda8963f8dd1fa474e16354618599"
      end
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.0/picoflow-v0.1.0-x86_64-linux.tar.gz"
      sha256 "f8f4dfe295cb05aea9411493945e84021735e8315d201b30fe3c535a337f244d"
    end
  end

  def install
    bin.install "picoflow"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/picoflow --version")
  end
end

