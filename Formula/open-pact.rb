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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.1/open-pact-client-aarch64-apple-darwin"
      sha256 "c8d8c526237bd84c3ce83f5d791f9134ddb16747f415adab09f1fb15751c46ae"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.1/open-pact-client-x86_64-apple-darwin"
      sha256 "7aba3c6ae3461bc63148088e12dc968bdc2d4d64e69473dfdc8b43c915914ac4"
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
    assert_match "open-pact-client 0.4.1", shell_output("#{bin}/open-pact-client --version")
  end
end
