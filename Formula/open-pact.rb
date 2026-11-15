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
      url "https://github.com/gaboe/open-pact/releases/download/v0.5.0/open-pact-client-aarch64-apple-darwin"
      sha256 "40835d7dec16f46adcd0c2c4e3e84577a8f7acf4138cdd0830aa0726cea376ac"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.5.0/open-pact-client-x86_64-apple-darwin"
      sha256 "1a63b5b68396fe8abdb50eb4e190ea4f10ccc2ac8d3a178678937b889ba35b46"
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
    assert_match "open-pact-client 0.5.0", shell_output("#{bin}/open-pact-client --version")
  end
end
