class Picoflow < Formula
  desc "Lightweight DAG workflow orchestrator for edge devices"
  homepage "https://github.com/zoza1982/picoflow"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-arm64-macos.tar.gz"
      sha256 "39fc48c73571ccb11c308b54ea72e5f961c027029a414124fe55bda4b9129b71"
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-x86_64-macos.tar.gz"
      sha256 "439f4f4d693a492fd538a1fb28de21ea72d269c75cf084213c1fb9a8713ccdbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm64-linux.tar.gz"
        sha256 "cb0b23167b35805923689cba63ad3d27077b350b2412cbeaea8ec43e5f59f515"
      else
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm32-linux.tar.gz"
        sha256 "2053d2eff9dcd39e7ca5257900c8400d979ae33b20e7134c2b5abf0ed59906d4"
      end
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-x86_64-linux.tar.gz"
      sha256 "a242c096740fea17dc073b00bd05dcd770371caceedb3d2da15f5de508b2b85c"
    end
  end

  def install
    bin.install "picoflow"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/picoflow --version")
  end
end
