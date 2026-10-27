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
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.1/open-pact-client-aarch64-apple-darwin"
      sha256 "cd5f9be2cf8234014d00b2e4d4cba285af63999d78e9da7f4c965dc068886586"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.1/open-pact-client-x86_64-apple-darwin"
      sha256 "9f17e08e58b8005d19223509af617be58ee5727b42141a9dff58264955da5ece"
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
    assert_match "open-pact-client 0.3.1", shell_output("#{bin}/open-pact-client --version")
  end
end
