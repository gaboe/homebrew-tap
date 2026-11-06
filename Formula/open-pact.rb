# typed: strict
# frozen_string_literal: true

# Open Pact client formula.
class OpenPact < Formula
  desc "Verifiable security checks for personally owned devices"
  homepage "https://github.com/gaboe/open-pact"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.3/open-pact-client-aarch64-apple-darwin"
      sha256 "22647be948f875f2af3e56dc1ce375a9c6a9952270e663390fb13c5da6673544"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.3/open-pact-client-x86_64-apple-darwin"
      sha256 "3c8a86606803386cd13cda304f611573a5a95e7726a2760f0acf3517c798e84a"
    end
  end

  # Generated from the published SHA256SUMS.
  def install
    if Hardware::CPU.arm?
      bin.install "open-pact-client-aarch64-apple-darwin" => "open-pact-client"
    else
      bin.install "open-pact-client-x86_64-apple-darwin" => "open-pact-client"
    end
  end

  test do
    assert_match "open-pact-client 0.4.3", shell_output("#{bin}/open-pact-client --version")
  end
end
