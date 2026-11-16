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
      url "https://github.com/gaboe/open-pact/releases/download/v0.7.0/open-pact-client-aarch64-apple-darwin"
      sha256 "d96d7ea8104cacf0ff01aebc3e6452764d4d8fdd5f1d222aecd3fd4c6713ee9f"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.7.0/open-pact-client-x86_64-apple-darwin"
      sha256 "66fa4b42dfe00f462329f70849fb60d4904a48dfdf4d04defbfede29a33c9c80"
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
    assert_match "open-pact-client 0.7.0", shell_output("#{bin}/open-pact-client --version")
  end
end
