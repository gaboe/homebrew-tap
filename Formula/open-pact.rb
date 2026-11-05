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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.2/open-pact-client-aarch64-apple-darwin"
      sha256 "d6a57e49c1c6155c71c3c00599a172140498031b07f2bcb6afe01589ff2fa392"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.2/open-pact-client-x86_64-apple-darwin"
      sha256 "5a28226eda0e789e420055e9331578c3bd418c3af2c34dcab1c1814b098d9e6d"
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
    assert_match "open-pact-client 0.4.2", shell_output("#{bin}/open-pact-client --version")
  end
end
