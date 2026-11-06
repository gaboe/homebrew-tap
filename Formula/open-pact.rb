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
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.4/open-pact-client-aarch64-apple-darwin"
      sha256 "44e4dad0a5d117709a9617cde2f3fa1166437b73a2571f0694afe07a6cbc7b84"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.4.4/open-pact-client-x86_64-apple-darwin"
      sha256 "5eb85f8d1054b4edb5e5877f334c08c579133e708ef683648772acf1fb346d46"
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
    assert_match "open-pact-client 0.4.4", shell_output("#{bin}/open-pact-client --version")
  end
end
