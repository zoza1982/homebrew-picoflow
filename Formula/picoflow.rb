class Picoflow < Formula
  desc "Lightweight DAG workflow orchestrator for edge devices"
  homepage "https://github.com/zoza1982/picoflow"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.2/picoflow-v0.1.2-darwin-arm64-macos.tar.gz"
      sha256 "ba6de2d86fd4f48104d219cae24161d775158e6609491a53d83f779f15120cc4"
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.2/picoflow-v0.1.2-darwin-x86_64-macos.tar.gz"
      sha256 "7ae0c7737d24b3b4b3b5eb381e905be3ac25532db3574a55092b276c8c50ae3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.2/picoflow-v0.1.2-arm64-linux.tar.gz"
        sha256 "0f4797f5816e89b51811779ada90764335e172b6d78e512ef2eb5e772b4dfd76"
      else
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.2/picoflow-v0.1.2-arm32-linux.tar.gz"
        sha256 "57f04c796d22ec8fa8c5cc45bb1cf87aaab482e321ea3d2c748de2ff01ff6eb3"
      end
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.2/picoflow-v0.1.2-x86_64-linux.tar.gz"
      sha256 "d3289ee929ebd5afe223999b0b8014e5c036c31c6d351c7997dd14d2622c425c"
    end
  end

  def install
    bin.install "picoflow"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/picoflow --version")
  end
end
