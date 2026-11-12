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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.7/open-pact-client-aarch64-apple-darwin"
      sha256 "52f85b00bda68e86e3840f77ae84efdd3e9d060e0b3934da7a1505fb7990e108"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.7/open-pact-client-x86_64-apple-darwin"
      sha256 "96592159cb229675c1d40c952ae0f67ac390098dadcb36a20f47dd33c08487d9"
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
    assert_match "open-pact-client 0.4.7", shell_output("#{bin}/open-pact-client --version")
  end
end
