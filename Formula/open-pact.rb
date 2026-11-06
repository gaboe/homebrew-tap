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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.6/open-pact-client-aarch64-apple-darwin"
      sha256 "4fd8d5093f6e9b5caf27a590fc2328c4911ba98c4743aeade2f648283787ee1d"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.6/open-pact-client-x86_64-apple-darwin"
      sha256 "eeaf7a65185a5ac14e3ffda19725b1b725ad77c09ed320bcbc18b515584ca946"
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
    assert_match "open-pact-client 0.4.6", shell_output("#{bin}/open-pact-client --version")
  end
end
