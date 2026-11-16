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
      url "https://github.com/gaboe/open-pact/releases/download/v0.7.1/open-pact-client-aarch64-apple-darwin"
      sha256 "baf9d4a9481253051fbf405cffdb631244df0958c79b265cabbc06f13ac74202"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.7.1/open-pact-client-x86_64-apple-darwin"
      sha256 "5bd371bf823d5bd4dfe87242f67d957e69ad1c0227086bc0935628de789b8bdc"
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
    assert_match "open-pact-client 0.7.1", shell_output("#{bin}/open-pact-client --version")
  end
end
