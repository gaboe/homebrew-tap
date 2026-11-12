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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.9/open-pact-client-aarch64-apple-darwin"
      sha256 "72db206a1980d5c10923bebe099e0c73ab564c1eeea91077fc36c494cadbe898"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.9/open-pact-client-x86_64-apple-darwin"
      sha256 "d4cf68b38ef03849673c604fb86dbea268342608164956bd4fd3e5b94305e654"
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
    assert_match "open-pact-client 0.4.9", shell_output("#{bin}/open-pact-client --version")
  end
end
