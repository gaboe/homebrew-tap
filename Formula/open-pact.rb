# typed: strict
# frozen_string_literal: true

# Open Pact client formula.
class OpenPact < Formula
  desc "Verifiable security checks for personally owned devices"
  homepage "https://github.com/gaboe/open-pact"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.2/open-pact-client-aarch64-apple-darwin"
      sha256 "0b0e3d619719a74fec8c069b76fc9bf0669e7bf1fad6a867fe06e365c3fc7964"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.2/open-pact-client-x86_64-apple-darwin"
      sha256 "250439d04ede36a4a99387c41348aaeddb4ae255798aec5aa0ab26f2c0fe862d"
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
    assert_match "open-pact-client 0.8.2", shell_output("#{bin}/open-pact-client --version")
  end
end
