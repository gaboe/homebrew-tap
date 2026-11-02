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
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.3/open-pact-client-aarch64-apple-darwin"
      sha256 "b74953d5912ec6a9e5c118cb81c034914c5dc8e7c403dba415d71ce7fa20b8d5"
    end

    on_intel do
      url "https://github.com/gaboe/open-pact/releases/download/v0.3.3/open-pact-client-x86_64-apple-darwin"
      sha256 "40e35151626bc0ddf3279590bdc12d8b08c48ada47a75c26dcef27a2c5eb48ab"
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
    assert_match "open-pact-client 0.3.3", shell_output("#{bin}/open-pact-client --version")
  end
end
