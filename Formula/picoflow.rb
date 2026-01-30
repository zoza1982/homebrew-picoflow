class Picoflow < Formula
  desc "Lightweight DAG workflow orchestrator for edge devices"
  homepage "https://github.com/zoza1982/picoflow"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-arm64-macos.tar.gz"
      sha256 "0ca7b8fed401d657ba6d8e87137476c7f73691148564a4112eaef7ebe3532219"
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-darwin-x86_64-macos.tar.gz"
      sha256 "7328e2cf393d77714bd160caf175778dd6b838c18b56788fd9fd3f2a422be512"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm64-linux.tar.gz"
        sha256 "a9941d118fe6aa810524c536e23dc2474e00907efb80552e9d0bf3b1f9d397dd"
      else
        url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-arm32-linux.tar.gz"
        sha256 "e640273871805cf477e15f35a6d54c416b33b8f3c8f91b1c469e75cc4d5940f0"
      end
    else
      url "https://github.com/zoza1982/picoflow/releases/download/v0.1.1/picoflow-v0.1.1-x86_64-linux.tar.gz"
      sha256 "3160df7dc6ee1f5f31fab45e32c926a7183f36db2a4ef9f3b4b374130799fe5e"
    end
  end

  def install
    bin.install "picoflow"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/picoflow --version")
  end
end
