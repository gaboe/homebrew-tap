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
      url "https://github.com/gaboe/open-pact/releases/download/v0.9.0/open-pact-client-aarch64-apple-darwin"
      sha256 "afc3654e11e0c51637b671e9e24d03aaaa59663262753fe34662a46c29d37843"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.9.0/open-pact-client-x86_64-apple-darwin"
      sha256 "bb570f4145404b4afbfd7d3a97572afc900eb34db8c5e9299bfe73340b160381"
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
    assert_match "open-pact-client 0.9.0", shell_output("#{bin}/open-pact-client --version")
  end
end
