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
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.1/open-pact-client-aarch64-apple-darwin"
      sha256 "5390aaaa283db95ac4551ff0b51b53662c417185c80c467e60bab04dc28478db"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.8.1/open-pact-client-x86_64-apple-darwin"
      sha256 "5ea4a1524705f192bae477579ef4033a7ce78f9bf51353065bcee9497d645901"
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
    assert_match "open-pact-client 0.8.1", shell_output("#{bin}/open-pact-client --version")
  end
end
