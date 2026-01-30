class Picoflow < Formula
  desc "Lightweight DAG workflow orchestrator for edge devices"
  homepage "https://github.com/zoza1982/picoflow"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-arm64-macos.tar.gz"
      sha256 "889e4281ab98d8c926a756bc0f5e2e5d07c3c0806b30c322f74d53db217b11cb"
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-x86_64-macos.tar.gz"
      sha256 "cec44720322ff8f919b10327baa417ac31c7898f184a598b89ef301eb5551bba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm64-linux.tar.gz"
        sha256 "57d68298818f777d431bf8242c83eda38eb2de74f18c46c268f20de9ffa6efa6"
      else
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm32-linux.tar.gz"
        sha256 "9526795763bc428441fd92b167a07b9be6a68c2f8f1cb258c08d422fdf8607bb"
      end
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-x86_64-linux.tar.gz"
      sha256 "1c9f1f9cef19b7391c506739e3e6d470402fef3b7af6c418eb134bda261fb604"
    end
  end

  def install
    bin.install "picoflow"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/picoflow --version")
  end
end
